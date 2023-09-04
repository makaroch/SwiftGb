//
//  FriendViewController.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
final class FriendViewController: UITableViewController{
    private let networkService = NetworkService()
    private var models:[Friend] = []
    private var fileCache = FileCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        models = fileCache.fetchFriends()
        tableView.reloadData()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"),
                                                            style: .plain, target: self, action: #selector(profileTap))
        
        tableView.register(FriendCell.self, forCellReuseIdentifier:"FriendCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        //networkService.getFiends{[weak self] friends in self?.models=friends
        //    DispatchQueue.main.async{
        //        self?.tableView.reloadData()
        //    }
        //}
        
        getFriends()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
                    return UITableViewCell()
                }
        
        let model = models[indexPath.row]
        cell.updateCell(model:model)
        cell.tap = {[weak self] text, photo in self?.navigationController?.pushViewController(ProfileViewController(name: text, photo: photo, isUserProfile: false), animated: true)}
        return cell
    }
    
    func getFriends(){
        networkService.getFiends{[weak self] result in
            switch result {
            case .success(let friends):
                self?.models = friends
                self?.fileCache.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
}
@available(iOS 13.0, *)
private extension FriendViewController {
    @objc func profileTap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .fade
        animation.duration = 1
        self.navigationController?.view.layer.add(animation,  forKey: nil)
        self.navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
    }
    @objc func update() {
        networkService.getFiends{[weak self] result in
            switch result{
            case .success(let friends):
                self?.models = friends
                self?.fileCache.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            DispatchQueue.main.async{
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}

@available(iOS 13.0, *)
private extension FriendViewController {
    func showAlert() {
        //let date = Theme.drawDate(date: fileCache.fetchFriendDate())
        let date = DateHelper.getDate(date: fileCache.fetchFriendDate())
        let alert = UIAlertController(title: "Can't get data", message: "Last update was \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
