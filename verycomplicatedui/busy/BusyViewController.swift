//
//  BusyViewController.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit


class BusyViewController: UIViewController, ColorDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let overlayViewController = segue.destination as? OverlayViewController else {
            preconditionFailure()
        }
        overlayViewController.delegate = self
    }
}
