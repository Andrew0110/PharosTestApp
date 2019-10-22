//
//  SingleButtonView.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

private let inset: CGFloat = 20
private let height: CGFloat = 40

class SingleButtonView: BaseView {
    
    private let button = ActionButton()
    var action: Action? {
        didSet {
            button.action = action
        }
    }
    
    override func setupSubviews() {
        addSubview(button)
        button.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: inset, bottom: 0, right: inset), size: .init(width: 0, height: height))
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        button.setupUI(bordered: false, textColor: .white, secondaryColor: .lightGray)
    }
}
