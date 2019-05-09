//
//  OverlayViewController.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-09.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {
    
    @IBOutlet weak var animatedView: UIView!
    
    var bounce = (top: true, left: true, bottom: true, right: true)
    var animateInsets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    var animateRange: (minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) {
        let insets = union(insets: animateInsets, view.safeAreaInsets)
        return (
            minX: insets.left,
            maxX: view.bounds.width - insets.right,
            minY: insets.top,
            maxY: view.bounds.height - insets.bottom
        )
    }
    var anchors: [CGFloat] = []
    
    var y: CGFloat = 0 {
        didSet {
            var frame = animatedView.frame
            frame.origin.y = y
            animatedView.frame = frame
        }
    }
    
    var animator: UIViewPropertyAnimator?
    var animation: (from: CGFloat, to: CGFloat) = (0, 0)
    
    func nearest(n: CGFloat, among: [CGFloat]) -> CGFloat {
        var minD = CGFloat.infinity
        var r = n
        
        for they in among {
            let d = abs(n - they)
            if d < minD {
                minD = d
                r = they
            }
        }
        return r
    }
    
    func union(insets: UIEdgeInsets...) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: insets.map({$0.top}).max() ?? 0,
            left: insets.map({$0.left}).max() ?? 0,
            bottom: insets.map({$0.bottom}).max() ?? 0,
            right: insets.map({$0.right}).max() ?? 0
            // ?????????????????????????????????????????????????????
        )
    }
    
    @IBAction func panHandler(_ sender: UIPanGestureRecognizer) {
        let tr = sender.translation(in: view)
        let ve = sender.velocity(in: view)
        
        switch sender.state {
        case .began:
            break
        case .changed:
            sender.setTranslation(CGPoint.zero, in: view)
            pan(dY: tr.y)
        case .ended:
            animateTo(y: nearest(n: y, among: anchors + [animateRange.maxY, animateRange.minY]))
        default:
            break
        }
    }
    
    func animateTo(y: CGFloat) {
        animator = UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {self.y = y},
            completion: nil
        )
    }
    
    func applyDrag(n: CGFloat) -> CGFloat {
        return CGFloat(signOf: n, magnitudeOf: sqrt(0.25 * abs(n)))
    }
    
    func pan(dY: CGFloat) {
        switch y {
        case ...animateRange.minY: // top
            y += bounce.top ? applyDrag(n: dY) : max(0, dY)
        case animateRange.maxY...:
            y += bounce.bottom ? applyDrag(n: dY) : min(0, dY)
        default:
            y += dY
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OverlayViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
