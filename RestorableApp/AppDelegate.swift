//
//  AppDelegate.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool { return true }
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool { return true }
}

