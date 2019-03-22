//
//  NSObject+Extension.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    var `class`: Self.Type { return type(of: self) }
    static var className: String { return String(describing: self) }
    var className: String { return String(describing: type(of: self)) }
}
