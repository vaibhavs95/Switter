//
//  TweetDataModel.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation

struct Tweet: Codable {

    var id: Int?
    var text: String?
    var created: String?
    var source: String?
    var user: User?
    var entities: [Entity]?

    enum CodingKeys: String, CodingKey {

        case id
        case text
        case created = "created_at"
        case source
        case user
        case entities
    }
}

