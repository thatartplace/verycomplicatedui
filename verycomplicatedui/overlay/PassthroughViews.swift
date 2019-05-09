//
//  PassthroughView.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit

class PassthroughView: UIView {    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}

class PassthroughScrollView: UIScrollView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
