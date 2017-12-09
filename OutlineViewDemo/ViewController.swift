//
//  ViewController.swift
//  OutlineViewDemo
//
//  Created by Nejat Serpen on 08/12/2017.
//  Copyright © 2017 Adeo IT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var outlineView: NSOutlineView!
    
    var groupImage = NSWorkspace.shared.icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kGenericHardDiskIcon)))
    var folderImage = NSWorkspace.shared.icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kGenericFolderIcon)))
    var nodeImage = NSWorkspace.shared.icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kGenericDocumentIcon)))

    var data: [Item] = TestData().items
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupImage.size = NSSize(width: 16, height: 16)
        folderImage.size = NSSize(width: 16, height: 16)
        nodeImage.size = NSSize(width: 16, height: 16)

        // Do any additional setup after loading the view.
        
        outlineView.expandItem(nil, expandChildren: true)

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}


