//
//  FacebookHelper.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import Foundation

class FacebookHelper {
    
    private let datastore = FacebookProfileDatastore()
    
    func fetchProfile(completion: @escaping (Profile)->Void) {
        if let profile = datastore.fetchProfile() {
            completion(profile)
        } else {
            updateProfile(completion: completion)
        }
    }
    
    func updateProfile(completion: @escaping (Profile)->Void) {
        FacebookAuthManager.instance.getProfileData { [weak self] (profileInfo) in
            onMainQueue {
                self?.datastore.appendProfile(profileInfo: profileInfo, completion: completion)
            }
        }
    }
    
    func clearAllData() {
        datastore.clearAllData()
    }
}
