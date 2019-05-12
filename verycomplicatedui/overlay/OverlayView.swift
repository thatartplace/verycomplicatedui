//
//  OverlayView.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-10.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit

class OverlayView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOffset = CGSize(width: 0, height: -10)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
    }
}
