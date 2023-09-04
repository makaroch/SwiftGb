//
//  PhotosModel.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

struct PhotosModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]?
}

struct Photo: Decodable {
    var id: Int
    var name: String?
    var sizes: [Sizes]
    
    struct Sizes:Codable{
        var url: String
    }

}
