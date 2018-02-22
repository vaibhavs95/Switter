//
//  EntityModel.swift
//  Switter
//
//  Created by Vaibhav Singh on 23/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation

struct Entity: Codable {

    var hashtags: [HashTag]?
    var media: [TweetMedia]?
    var url: [DisplayUrl]?
    var userMentions: [UserMention]?
    var polls: [Poll]?

    enum CodingKeys: String, CodingKey {
        case hashtags
        case media
        case url
        case userMentions = "user_mentions"
        case polls
    }
}

struct DisplayUrl: Codable {

    var indices: [Int]?
    var text: String?

    enum CodingKeys: String, CodingKey {

        case indices
        case text = "display_url"
    }
}

struct HashTag: Codable {

    var indices: [Int]?
    var text: String?

    enum CodingKeys: String, CodingKey {

        case indices
        case text
    }
}

struct TweetMedia: Codable {

    var id: Int?
    var media: String?
    var type: String?

    enum CodingKeys: String, CodingKey {

        case id
        case media = "media_url"
        case type
    }

    var mediaUrl: URL? {
        return URL(string: media ?? "")
    }
}

struct UserMention: Codable {

    var id: Int?
    var name: String?
    var indices: String?
    var username: String?

    enum CodingKeys: String, CodingKey {

        case id
        case name
        case indices
        case username = "screen_name"
    }
}

struct Poll: Codable {

    var options: [PollOptions]?
    var endDate: String?
    var duration: Int?

    enum CodingKeys: String, CodingKey {

        case options
        case endDate = "end_datetime"
        case duration
    }
}

struct PollOptions: Codable {

    var position: Int?
    var text: String?

    enum CodingKeys: String, CodingKey {

        case position
        case text
    }
}

