//
//  UserModel.swift
//  Switter
//
//  Created by Vaibhav Singh on 23/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation

struct User: Codable {

    var id: Int?
    var name: String?
    var username: String?
    var location: String?
    var description: String?
    var followers: Int?
    var friends: Int?
    var tweets: Int?
    var profileImage: String?
    var backgroundImage: String?

    enum CodingKeys: String, CodingKey {

        case id
        case name
        case username = "screen_name"
        case location
        case description
        case followers = "followers_count"
        case friends = "friends_count"
        case tweets = "statuses_count"
        case profileImage = "profile_image_url"
        case backgroundImage = "profile_background_image_url"
    }
}

extension User {

    var profileImageUrl: URL? {
        return URL(string: profileImage ?? "")
    }

    var backgroundImageUrl: URL? {
        return URL(string: backgroundImage ?? "")
    }
}
