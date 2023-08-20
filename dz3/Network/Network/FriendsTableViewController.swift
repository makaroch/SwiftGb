//
//  FriendsTableViewController.swift
//  Network
//
//  Created by Ринат on 09.08.2023.
//

import UIKit

final class FriendTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = Constants.Titles.FriendsTitle

        NetworkService().getFiends()
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
