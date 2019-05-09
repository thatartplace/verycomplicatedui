//
//  TodoTableCell.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit

class TodoTableCell: UITableViewCell {

    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
