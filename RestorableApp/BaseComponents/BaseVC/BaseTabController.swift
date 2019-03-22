//
//  BaseTabController.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import UIKit

class BaseTabController: UITabBarController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        restorationIdentifier = className
    }
}
