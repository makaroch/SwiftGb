//
//  MyFriendCell.swift
//  TabsAndTables
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class MyFriendCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func friendNumber(number: Int) {
        var content = defaultContentConfiguration()
        content.text = "Друг под номером \(number + 1)"
        contentConfiguration = content
    }
}
