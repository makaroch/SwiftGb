//
//  ProfileModel.swift
//  GB_HW_Swift
//
//  Created by Alina on 23.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//


struct ProfileModel: Decodable {
    var response: Profile
    
    struct Profile: Decodable {
        var photo: String
        var firstName: String
        var lastName: String
        
        enum CodingKeys: String, CodingKey {
            case photo = "photo_200"
            case firstName = "first_name"
            case lastName = "last_name"
        }
    }
}
