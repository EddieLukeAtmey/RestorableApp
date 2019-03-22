//
//  FirstModel.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import Foundation

final class FirstModel: NSObject, Codable, NSCoding {
    var name: String

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }

    init(name: String) {
        self.name = name
    }

    convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return nil }
        self.init(name: name)
    }
}
