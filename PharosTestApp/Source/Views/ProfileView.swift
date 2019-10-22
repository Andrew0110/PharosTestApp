//
//  ProfileView.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

private let inset: CGFloat = 20
private let height: CGFloat = 200

class ProfileView: BaseView {
    
    private let imageView = LoadingImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    override func setupSubviews() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        
        imageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: height, height: height))
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = height/2
        imageView.contentMode = .scaleAspectFill
        
        nameLabel.anchor(top: imageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: inset, left: inset, bottom: 0, right: inset))
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        emailLabel.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: inset, left: inset, bottom: 0, right: inset))
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    func configure(profile: Profile) {
        imageView.loadImage(imageURL: profile.photoURL)
        nameLabel.text = profile.name
        emailLabel.text = profile.email
    }
}
