//
//  LoginViewController.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/18/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var onLogInSuccess: (()->Void)?
    private let loginView = SingleButtonView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Titles.Login
        
        setupViews()
    }

    // MARK: - Setup UI
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(loginView)
        loginView.fillSuperview()
        
        loginView.action = Action(title: Constants.ButtonTitles.FBLogin, iconName: nil, handler: { [weak self] in
            self?.loginFacebook()
        })
    }
    
    // MARK: - Actions
    @objc private func loginFacebook() {
        FacebookAuthManager.instance.login(in: self, onSuccess: { [weak self] in
            self?.onLogInSuccess?()
        }) { [weak self] errorMessage in
            self?.showMessage(errorMessage)
        }
    }
}
