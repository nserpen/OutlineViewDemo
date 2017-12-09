//
//  Item.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//  Copyright © 2017 Adeo IT. All rights reserved.
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
