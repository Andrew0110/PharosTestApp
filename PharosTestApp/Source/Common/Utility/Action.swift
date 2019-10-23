//
//  Action.swift
//
//  Created by Andriy Roshchin on 3/18/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//

import Foundation

struct Action {
    let title: String?
    let iconName: String?
    let handler: () -> Void
}
