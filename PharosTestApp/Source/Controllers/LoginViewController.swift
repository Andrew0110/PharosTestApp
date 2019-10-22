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
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        loginButton.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 0, height: 40))
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.setTitleColor(.blue, for: .normal)
        
        loginButton.setTitle("Login with Facebook", for: .normal)
        loginButton.addTarget(self, action: #selector(loginFacebookAction), for: .touchUpInside)
        
        title = "Login"
    }

    @objc private func loginFacebookAction() {
        FacebookAuthManager.instance.login(in: self, onSuccess: { [weak self] in
            self?.onLogInSuccess?()
        }) { [weak self] errorMessage in
            self?.showMessage(errorMessage)
        }
    }
}

