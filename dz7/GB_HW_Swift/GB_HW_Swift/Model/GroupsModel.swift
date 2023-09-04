//
//  GroupsModel.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//
struct GroupsModel: Decodable {
    var response: Groups
}

struct Groups: Decodable {
    var items: [Group]
}

struct Group: Codable {
    var id: Int
    var name: String?
    var description: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo = "photo_50"
    }
}
