//
//  SingleButtonView.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class SingleButtonView: BaseView {
    
    private let button = ActionButton()
    var action: Action? {
        didSet {
            button.action = action
        }
    }
    
    override func setupSubviews() {
        addSubview(button)
        button.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 0, height: 40))
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        button.setupUI(bordered: false, textColor: .white, secondaryColor: .lightGray)
    }
}
