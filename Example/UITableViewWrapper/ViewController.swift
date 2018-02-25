//
//  ViewController.swift
//  UITableViewWrapper
//
//  Created by marinofelipe on 02/21/2018.
//  Copyright (c) 2018 marinofelipe. All rights reserved.
//

import UIKit
import UITableViewWrapper

class ViewController: UIViewController {

    @IBOutlet weak var wrappedTableView: UIWrappedTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Config
    func configTableView() {
        wrappedTableView.number(ofRowsBySection: [1, 3, 0])
        wrappedTableView.cell({ (tableView, indexPath) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            cell.textLabel?.text = "Testing framework - section: \(indexPath.section) - row: \(indexPath.row)"
            return cell
        })
        wrappedTableView.rowHeight = 150
    }
}

//to make tests more readable
extension ViewController {
    func preloadView() {
        _ = view
    }
}
