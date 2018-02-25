//
//  TableDataSourceWrapper.swift
//  Pods-UITableViewWrapper_Example
//
//  Created by Felipe Lefèvre Marino on 2/21/18.
//

import Foundation

public class TableDataSourceWrapper: NSObject {
    var numOfSections: Int? = 0
    var numOfRowsBySection: [Int] = [0] {
        didSet {
            self.numOfSections = numOfRowsBySection.count
        }
    }
    var cell: UITableViewCell?
}

extension TableDataSourceWrapper: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return numOfSections!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfRowsBySection[section]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let tableView = tableView as? UIWrappedTableView {
            tableView.indexPathOfDequeueingCell = indexPath
            if let cell = self.cell {
                return cell
            }
        }
        
        assertionFailure("Used table view should inherit from UIWrappedTableView OR cell block was not set for the table (use .cell(CellForRowAtIndexPathBlock) to define cell for each row!!")
        return UITableViewCell()
    }
}
