//
//  AppCoordinator.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/21/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class AppCoordinator {
    var navigationController: UINavigationController
    private let faceBookHelper = FacebookHelper()
    
    convenience init() {
        self.init(navigationController: UINavigationController())
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        configureNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func start() {
        if FacebookAuthManager.instance.isAuthorized() {
            showProfilePage()
        } else {
            showLoginPage()
        }
    }
}

private extension AppCoordinator {
    // MARK: - Configuration
    func configureNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidLogout), name: Notification.Name.init(Constants.Notifications.UserLogedOut), object: nil)
    }
    
    // MARK: - Navigation Actions
    @objc func onDidLogout() {
        faceBookHelper.clearAllData()
        start()
    }
    
    // MARK: - Navigation Actions
    func showLoginPage() {
        navigationController.isNavigationBarHidden = true
        let vc = LoginViewController()
        vc.onLogInSuccess = { [weak self] in
            self?.showProfilePage()
        }
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func showProfilePage() {
        navigationController.isNavigationBarHidden = false
        let vc = ProfileViewController()
        navigationController.setViewControllers([vc], animated: true)
        faceBookHelper.fetchProfile { vc.profile = $0 }
    }
}
