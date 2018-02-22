//
//  TweetPreviewCellPresentable.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation

protocol TweetPreviewCellPresentable {
    var id: Int { get }  // For uniqueness
    var imageURL: URL? { get }
    var text: String { get }
    var source: String { get }
    var createdDate: String { get }
    var user: String { get }
    var username: String { get }
}

struct TweetPreviewModel: TweetPreviewCellPresentable {

    var id: Int
    var imageURL: URL?
    var text: String
    var source: String
    var createdDate: String
    var user: String
    var username: String

    init(tweet: Tweet) {
        self.id = tweet.id ?? 0
        self.imageURL = tweet.entities?.first?.media?.first?.mediaUrl
        self.text = tweet.text ?? ""
        self.source = tweet.source ?? ""
        self.createdDate = tweet.created ?? ""
        self.user = tweet.user?.name ?? ""
        self.username  = tweet.user?.username ?? ""
    }
}

