//
//  FirstViewController.swift
//  RestorableApp
//
//  Created by Eddie on 2019/03/22.
//  Copyright © 2019 Eddie. All rights reserved.
//

import UIKit

final class FirstViewController: BaseVC {

    @IBOutlet private weak var tableView: UITableView!
    private lazy var data: [FirstModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func addData() {
        let model = FirstModel(name: String(data.count))
        data.append(model)
        tableView.insertRows(at: [IndexPath(row: data.count - 1, section: 0)], with: .automatic)
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate, UIDataSourceModelAssociation {
    func modelIdentifierForElement(at idx: IndexPath, in view: UIView) -> String? { return data[idx.row].name }

    func indexPathForElement(withModelIdentifier identifier: String, in view: UIView) -> IndexPath? {
        return IndexPath(row: Int(identifier) ?? 0, section: 0)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return data.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
}

extension FirstViewController: UIViewControllerRestoration {

    static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        guard let sb = coder.decodeObject(forKey: UIApplication.stateRestorationViewControllerStoryboardKey) as? UIStoryboard else { return nil }
        return sb.instantiateInitialViewController()
    }

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(data, forKey:"data")
    }

    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        if let data = coder.decodeObject(forKey: "data") as? [FirstModel] { self.data = data }
    }
}
