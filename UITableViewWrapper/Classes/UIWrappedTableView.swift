//
//  UIWrappedTableView.swift
//  Pods-UITableViewWrapper_Example
//
//  Created by Felipe Lefèvre Marino on 2/21/18.
//

/*
 no more linking data source and delegate
 no more a hundred methods and extensions
 */

import UIKit

public typealias CellForRowAtIndexPathBlock = ((_ tableView: UIWrappedTableView, _ indexPath: IndexPath) -> UITableViewCell?)

public protocol WrappedTableView: class {
    var wrapper: UITableViewWrapper {get set}
}

public class UIWrappedTableView: UITableView, WrappedTableView {
    // MARK: Properties
    public var wrapper: UITableViewWrapper
    private var numOfSections: Int?
    private var numOfRowsBySection: [Int] = [0] {
        didSet {
            wrapper.dataSourceWrapper.numOfRowsBySection = numOfRowsBySection
            self.numOfSections = numOfRowsBySection.count
        }
    }
    var cellForRow: CellForRowAtIndexPathBlock?
    var indexPathOfDequeueingCell: IndexPath? {
        didSet {
            if let cellForRow = cellForRow, let indexPath = indexPathOfDequeueingCell {
                wrapper.dataSourceWrapper.cell = cellForRow(self, indexPath)
            }
        }
    }
    
    // MARK: Init
    override init(frame: CGRect, style: UITableViewStyle) {
        wrapper = UITableViewWrapper()
        
        super.init(frame: frame, style: style)
        
        delegate = wrapper.delegateWrapper
        dataSource = wrapper.dataSourceWrapper
    }
    
    required public init?(coder aDecoder: NSCoder) {
        wrapper = UITableViewWrapper()
        super.init(coder: aDecoder)
        
        delegate = wrapper.delegateWrapper
        dataSource = wrapper.dataSourceWrapper
    }
    
    // MARK: Methods
    public func number(ofRowsBySection rowsBySection: [Int]) {
        numOfRowsBySection = rowsBySection
    }
    
    public func cell(_ block: @escaping CellForRowAtIndexPathBlock) {
        cellForRow = block
    }
    
    // MARK: Dequeue Reusable Indentifier
}
