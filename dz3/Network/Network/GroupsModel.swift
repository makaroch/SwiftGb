//
//  GroupsModel.swift
//  Network
//
//  Created by Ринат on 09.08.2023.
//

struct GroupsModel: Codable {
    var response: GroupsResponse?
}

struct GroupsResponse: Codable {
    var count: Int
    var items: [Group]?
}

struct Group: Codable {
    var id: Int
    var name: String?
    var membersCount: Int
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case membersCount = "members_count"
        case photo = "photo_50"
    }
}
