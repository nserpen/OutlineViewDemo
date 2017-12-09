//
//  TestData.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//  Copyright © 2017 Adeo IT. All rights reserved.
//

import Foundation

struct TestData {
    
    var items: [Item]
    
    init() {
        
        items = []
        for g in 1...3 {
            let group = Item("Group \(g)", .Group)
            for f in 1...3 {
                let item = Item("Folder \(g).\(f)", .Container)
                for n in 1...4 {
                    let node = Item("Node \(g).\(f).\(n)", .Node)
                    item.children.append(node)
                }
                group.children.append(item)
            }
            items.append(group)
        }
    }
}
