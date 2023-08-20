//
//  GroupsTableViewController.swift
//  Network
//
//  Created by Ринат on 09.08.2023.
//

import UIKit

final class GroupsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = Constants.Titles.GroupsTitle

        NetworkService().getGroups()
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
