//
//  NetworkService.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import Foundation
final class NetworkService {
    static var accessToken = ""
    static var userID = ""
    
    
    private let session = URLSession.shared
    
    func getFiends(completion: @escaping(Result<[Friend], Error>) ->Void) {
        guard let url = URL(string:
            "https://api.vk.com/method/friends.get?access_token=\(NetworkService.accessToken)&v=5.131&fields=online,photo_50")
            else {
                return
        }
        session.dataTask(with: url) { (data, _, error) in
                    guard let data else {
                        completion(.failure(NetworkError.dataError))
                        return
                    }
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    do {
                        let response = try JSONDecoder().decode(FriendModel.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
    }
    
    func getGroups(completion: @escaping([Group]) ->Void ){
        guard let url = URL(string:
            "https://api.vk.com/method/groups.get?access_token=\(NetworkService.accessToken)&v=5.131&extended=1&fields=members_count")
            else {
                return
        }
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups.response.items)
                print(groups)
            } catch {
                print(error)
            }
            }.resume()
    }
    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string:
            "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.accessToken)&v=5.131&album_id=profile") else {
                return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                completion(photos.response.items!)
                print(photos)
            } catch {
                print(error)
            }
            }.resume()
    }
    
    func getProfile(completion: @escaping (ProfileModel) -> Void) {
            let url = URL(string: endpoint.account.getProfileInfo)
            guard let url else { return }
            session.dataTask(with: url) { (data, _, error) in
                guard let data else { return }
                do {
                    let response = try JSONDecoder().decode(ProfileModel.self, from: data)
                    completion(response)
                } catch {
                    print(error)
                }
            }.resume()
        }}

