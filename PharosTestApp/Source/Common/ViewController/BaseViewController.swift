//
//  BaseViewController.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var needUpdates: Bool = true

    lazy private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        return activityIndicator
    }()


    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for view in view.subviews {
            if view.isKind(of: HUDView.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    // MARK: - Activity Indicator
    func setLoading(active: Bool) {
        active ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }

    // MARK: - Actions
    @objc func close() {
        if let nc = navigationController {
            nc.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showMessage(_ message: String, for length: CGFloat = 2) {
        HUDView.show(message, in: view, for: length)
    }
}
