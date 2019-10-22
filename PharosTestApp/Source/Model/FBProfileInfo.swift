//
//  FBProfileInfo.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import Foundation

struct FBProfileInfo {
    let first_name: String?
    let last_name: String?
    let name: String?
    let id: String?
    let email: String?
    let imageURL: String?
    
    init(dict: [String:Any]) {
        first_name = dict["first_name"] as? String
        last_name = dict["last_name"] as? String
        name = dict["name"] as? String
        id = dict["id"] as? String
        email = dict["email"] as? String
        imageURL = ((dict["picture"] as? [String:Any])?["data"] as? [String:Any])?["url"] as? String
    }
}
