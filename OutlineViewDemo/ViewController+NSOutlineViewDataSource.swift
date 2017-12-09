//
//  ViewController+NSOutlineViewDataSource.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//

import Cocoa

extension ViewController: NSOutlineViewDataSource {

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {

        if item == nil { // root
            return data.count
        }

        if let item = item as? Item {
            return item.numberOfChildren
        }

        return 0 // anything else
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil { // root
            return data[index]
        }

        if let item = item as? Item, item.type != .Node {
            return item.children[index]
        }

        return "UNKNOWN" // if this returns, check your code!
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        let item = item as! Item
        return item.isExpandable
    }

    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        if let column = tableColumn, column.identifier.rawValue == "outlineColumn", let item = item as? Item {
            return item.name
        }
        return nil
    }
}
