//
//  ActionButton.swift
//
//  Created by Andriy Roshchin on 3/26/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
  
    enum ActionButtonType {
        case icon
        case text
        case full
    }
    
    var action: Action? {
        didSet {
            update()
        }
    }
    
    var type: ActionButtonType = .icon {
        didSet {
            update()
        }
    }
    
    // MARK: - Initialize
    init(action: Action = Action(title: nil, iconName: nil, action: {}), type: ActionButtonType = .full) {
        self.type = type
        self.action = action
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Configuration
    func configure() {
        update()
        contentHorizontalAlignment = .left
        addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    func update() {
        setTitle((type == .text || type == .full) ? action?.title ?? "" : "", for: .normal)
        setImage((type == .icon || type == .full) ? UIImage(named: action?.iconName ?? "")?.withRenderingMode(.alwaysTemplate) : nil, for: .normal)
        setImage((type == .icon || type == .full) ? UIImage(named: action?.iconName ?? "")?.withRenderingMode(.alwaysTemplate) : nil, for: .highlighted)
    }
    
    // MARK: - Actions
    @objc func click() {
        action?.action()
    }
    
    func setupUI(bordered: Bool = false, textColor: UIColor = .blue, secondaryColor: UIColor = .clear) {
        setTitleColor(textColor, for: .normal)
        imageView?.tintColor = textColor
        tintColor = textColor
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        backgroundColor = secondaryColor
        contentHorizontalAlignment = .center
        
        layer.cornerRadius = 5
        layer.borderWidth = bordered ? 2 : 0
        layer.borderColor = textColor.cgColor
    }
}