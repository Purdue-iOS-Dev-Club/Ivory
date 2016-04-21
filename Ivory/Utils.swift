//
//  Utils.swift
//  Ivory
//
//  Created by George Lo on 2/12/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit
import KYDrawerController

class Utils: NSObject {
    
    // MARK: Side Menu
    
    class func SideMenuBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "Menu"), style: .Done, target: self, action: #selector(_sideMenuButtonTapped))
    }
    
    class func _sideMenuButtonTapped() {
        (UIApplication.sharedApplication().delegate as! AppDelegate).drawerController!.setDrawerState(KYDrawerController.DrawerState.Opened, animated: true)
    }
}
