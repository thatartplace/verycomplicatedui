//
//  OverlayViewController.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let padding = scrollView.bounds.height * 0.8
        scrollView.contentInset = UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0)
    }
}

extension OverlayViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // dont bounce if scrolled to top
        if scrollView.contentOffset.y > 0 {
            scrollView.contentOffset.y = 0
        }
        
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y == 0 {
            tableView.isScrollEnabled = true
        }
        else {
            tableView.isScrollEnabled = false
        }
    }
}

extension OverlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverlayTableCell", for: indexPath)
        
        return cell
    }
}
