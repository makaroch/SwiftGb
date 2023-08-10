//
//  FriendsTableViewController.swift
//  TabsAndTables
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class FriendTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Друзья"
    }

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        5
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myFriendCell = MyFriendCell()
        myFriendCell.friendNumber(number: indexPath.item)
        return myFriendCell
    }
}
