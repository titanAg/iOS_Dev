//
//  TableViewController.swift
//  CollegeTableViewDB
//
//  Created by Kyle on 2022-03-05.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var selections:[String] = ["Add a student", "Find a student", "Update a student", "Delete a student"]

 override func viewDidLoad() {
    super.viewDidLoad()
 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VC2 = segue.destination as? ViewController else { return }
        let indexPath = tableView.indexPathForSelectedRow
        VC2.selection = selections[(indexPath?.row)!]
    }
    
}
