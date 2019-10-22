//
//  ProfileViewController.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/21/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    var profile: Profile? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain,  target: self, action: #selector(logoutTapped))

        if profile != nil {
            configureView()
        }
    }
    
    func configureView() {
        
    }
    
    // MARK: - Actions
    @objc func logoutTapped() {
        FacebookAuthManager.instance.logout()
    }
}
