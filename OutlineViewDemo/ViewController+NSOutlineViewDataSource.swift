//
//  ViewController+NSOutlineViewDataSource.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//  Copyright © 2017 Adeo IT. All rights reserved.
//

import Cocoa

extension ViewController: NSOutlineViewDataSource {

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {

        if item == nil { // root
            return data.count
        }

        if let item = item as? Item {
            if item.type == .Node {
                return 0
            }
            return item.children.count
        }

        return 0
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return data[index]
        }

        if let item = item as? Item, item.type != .Node {
            return item.children[index]
        }

        return "BAD ITEM"
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        let item = item as! Item
        return item.type != .Node
    }

    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        if let column = tableColumn, column.identifier.rawValue == "outlineColumn", let item = item as? Item {
            return item.name
        }
        return nil
    }
}
