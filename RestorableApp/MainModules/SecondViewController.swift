//
//  SecondViewController.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import UIKit

final class SecondViewController: BaseVC {
    @IBOutlet private var tfInput: UITextField!
}

extension SecondViewController: UIViewControllerRestoration {

    static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        guard let sb = coder.decodeObject(forKey: UIApplication.stateRestorationViewControllerStoryboardKey) as? UIStoryboard else { return nil }
        return sb.instantiateInitialViewController()
    }

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(tfInput.text, forKey:"data")
    }

    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        tfInput.text = coder.decodeObject(forKey: "data") as? String
    }
}


extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
