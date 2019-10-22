//
//  ProfileViewController.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/21/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    private let profileView = ProfileView()
    var profile: Profile? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Titles.Profile
        
        setupViews()
    }

    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.ButtonTitles.Logout, style: .plain,  target: self, action: #selector(logoutTapped))
        
        view.addSubview(profileView)
        profileView.fillSuperview()
    }
    
    func configureView() {
        if let profile = profile {
            profileView.configure(profile: profile)
        }
    }
    
    // MARK: - Actions
    @objc func logoutTapped() {
        FacebookAuthManager.instance.logout()
    }
}
