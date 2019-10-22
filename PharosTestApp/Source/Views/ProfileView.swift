//
//  ProfileView.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class ProfileView: BaseView {
    
    private let imageView = LoadingImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    override func setupSubviews() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        
        imageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 200, height: 200))
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        nameLabel.anchor(top: imageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        emailLabel.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    func configure(profile: Profile) {
        imageView.loadImage(imageURL: profile.photoURL)
        nameLabel.text = profile.name
        emailLabel.text = profile.email
    }
}
