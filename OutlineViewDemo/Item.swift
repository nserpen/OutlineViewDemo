//
//  Item.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//

import Foundation

enum ItemType {
    case Group
    case Container
    case Node
}

class Item {

    var name: String
    var type: ItemType
    var children: [Item]

    var isExpandable: Bool {
        get {
            return type != .Node
        }
    }
    
    var numberOfChildren: Int {
        get {
            return self.type == .Node ? 0 : self.children.count
        }
    }

    init(_ name: String, _ type: ItemType, _ children: [Item]? = nil) {
        self.name = name
        self.type = type
        if let children = children {
            self.children = children
        } else {
            self.children = []
        }
    }
}
