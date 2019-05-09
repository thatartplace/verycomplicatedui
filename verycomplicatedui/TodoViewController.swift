//
//  IntroViewController.swift
//  verycomplicatedui
//
//  Created by thatartplace on 2019-05-08.
//  Copyright © 2019 thatartplace. All rights reserved.
//

import UIKit


struct Todo {
    var text: String
    var checked: Bool
    var date: Date
}

class TodoViewController: UIViewController {
    
    let reuseID = "TodoTableCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = []
    
    func todoSection(section: Int) -> [Todo] {
        let checked = [false, true][section]
        return todos.filter({$0.checked == checked})
    }
    
    @IBAction func submitHandler(_ sender: UIButton) {
    }
    
    @IBAction func fetchHandler(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TodoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // only show completed section if there are completed items
        return todos.filter({$0.checked}).count > 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoSection(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! TodoTableCell
        let todo = todoSection(section: indexPath.section)[indexPath.row]
        
        cell.textView.text = todo.text
        cell.label.text = todo.date.description
        cell.toggle.isOn = todo.checked
        
        return cell
    }
}
