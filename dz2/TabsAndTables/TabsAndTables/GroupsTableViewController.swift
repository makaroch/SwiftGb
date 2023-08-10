//
//  GroupsTableViewController.swift
//  TabsAndTables
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Группы"
    }

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        5
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myGroupCell = MyGroupCell()
        myGroupCell.groupNumber(number: indexPath.item)
        return myGroupCell
    }
}
