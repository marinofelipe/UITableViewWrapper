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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Config
    func configTableView() {
//        wrappedTableView.setAmount(Ofsections: 3, rowsBySection: [1, 0, 3])
    }
}

