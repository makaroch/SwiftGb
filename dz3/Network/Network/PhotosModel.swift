//
//  PhotosModel.swift
//  Network
//
//  Created by Ринат on 09.08.2023.
//

struct PhotosModel: Codable {
    var response: PhotosResponse?
}

struct PhotosResponse: Codable {
    var count: Int
    var items: [Photo]?
}

struct Photo: Codable {
    var id: Int
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "text"
    }
}
