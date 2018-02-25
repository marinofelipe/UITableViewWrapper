//
//  UITableViewWrapper.swift
//  Pods-UITableViewWrapper_Example
//
//  Created by Felipe Lefèvre Marino on 2/21/18.
//

import Foundation

public protocol WrappedTable {
    
}

public protocol TableWrapper {
    var dataSourceWrapper: TableDataSourceWrapper {get set}
    var delegateWrapper: TableDelegateWrapper {get set}
}

public class UITableViewWrapper: TableWrapper {
    public var dataSourceWrapper: TableDataSourceWrapper
    public var delegateWrapper: TableDelegateWrapper
    
    init() {
        dataSourceWrapper = TableDataSourceWrapper()
        delegateWrapper = TableDelegateWrapper()
    }
}
