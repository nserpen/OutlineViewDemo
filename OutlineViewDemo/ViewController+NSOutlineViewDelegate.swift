//
//  ViewController+NSOutlineViewDelegate.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//

import Cocoa

extension ViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, shouldExpandItem item: Any) -> Bool {
        return true
    }

    func outlineView(_ outlineView: NSOutlineView, shouldCollapseItem item: Any) -> Bool {
        return true
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {

        guard let item = item as? Item else {
            return nil
        }
        
        let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("outlineColumnItem"), owner: self) as! NSTableCellView
        cell.textField!.stringValue = item.name
        
        if let column = tableColumn {
            if column.identifier.rawValue == "outlineColumn" {
                cell.imageView!.image = item.type == .Container ? folderImage : nodeImage
                return cell
            }
        } else { // if GroupItem -> tableColumn is nil by design
            cell.imageView!.image = groupImage
            return cell
        }
        
        return nil

    }
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        if let item = item as? Item, item.type == .Group {
            return true
        }
        return false
    }
}

