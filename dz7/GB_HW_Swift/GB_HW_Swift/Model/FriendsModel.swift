//
//  FriendsModel.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

struct FriendsModel: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var count: Int
    var items: [Friend]
}

struct Friend: Codable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}
