//
//  GroupViewController.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit


@available(iOS 13.0, *)
final class GroupsViewController: UITableViewController {
    private let networkService = NetworkService()
    private var models: [Group] = []
    private let fileCache = FileCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = fileCache.fetchGroups()
        tableView.reloadData()
        title = "Groups"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        tableView.register(GroupCell.self, forCellReuseIdentifier:"GroupCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        getGroups()
    }
            

    override func tableView(_ _tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            models.count
            
    }
            
    override func tableView(_ _tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
                    return UITableViewCell()
                }
                let model = models[indexPath.row]
                cell.updateCell(model:model)
                return cell
}
    
    func getGroups(){
        networkService.getGroups{[weak self] result in
            switch result {
            case .success(let groups):
                self?.models = groups
                self?.fileCache.addFriends(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    
    
}
@available(iOS 13.0, *)
private extension GroupsViewController {

    @objc func update() {
        networkService.getGroups{[weak self] result in
            switch result{
            case .success(let groups):
                self?.models = groups
                self?.fileCache.addFriends(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchGroups()?? []
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
private extension GroupsViewController {
    func showAlert() {
        //let date = Theme.drawDate(date: fileCache.fetchFriendDate())
        let date = DateHelper.getDate(date: fileCache.fetchGroupDate())
        let alert = UIAlertController(title: "Can't get data", message: "Last update was \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
