//
//  AuthorizationViewController.swift
//  GB_HW_Swift
//
//  Created by Alina on 21.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//


import UIKit
import WebKit

@available(iOS 13.0, *)
class AuthorizationViewController: UIViewController, WKNavigationDelegate {
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let clientID = Bundle.main.object(forInfoDictionaryKey: "ClientID") else {
  
            let labelView = UILabel()
            labelView.text = "Exeption cliend_id"
            labelView.textAlignment = .center
            labelView.textColor = .red
            labelView.backgroundColor = .systemBackground
            labelView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(labelView)

            NSLayoutConstraint.activate([
                labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                labelView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                labelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                labelView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            ])

            return
        }

        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])

        let url = URL(string:
            "https://oauth.vk.com/authorize?" +
                "client_id=\(clientID)&" +
                "redirect_uri=https://oauth.vk.com/blank.html&" +
                "scope=262150&" +
                "display=mobile&" +
                "response_type=token")
        webView.load(URLRequest(url: url!))
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void)
    {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.accessToken = params["access_token"] ?? "invalid_token"
        NetworkService.userID = params["user_id"] ?? "invalid_user_id"

        decisionHandler(.cancel)
        webView.removeFromSuperview()

        enterTabViewTap()
    }

    func enterTabViewTap() {
        let friendsVC = UINavigationController(rootViewController: FriendViewController())
        friendsVC.tabBarItem.title = Constants.Identifier.FriendsTitle

        let groupsVC = UINavigationController(rootViewController: GroupsViewController())
        groupsVC.tabBarItem.title = Constants.Identifier.GroupsTitle

        let photoVC = UINavigationController(rootViewController:
            PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        photoVC.tabBarItem.title = Constants.Identifier.PhotosTitle

        let tabsControllers = [friendsVC, groupsVC, photoVC]
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = tabsControllers

        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first
        else {
            return
        }
        firstWindow.rootViewController = tabBarVC
    }
}
