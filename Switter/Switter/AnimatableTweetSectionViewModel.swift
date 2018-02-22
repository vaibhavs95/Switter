//
//  AnimatableTweetSectionViewModel.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation
import RxDataSources


// Table section items
enum TweetPreviewSectionItem {
    case tweet(presentable: TweetPreviewCellPresentable)
}

extension TweetPreviewSectionItem: IdentifiableType, Equatable {
    typealias Identity = Int

    var identity: Identity {
        switch self {
        case let .tweet(presentable):
            return presentable.id   //parameter for uniqueness
        }
    }
}

func == (lhs: TweetPreviewSectionItem, rhs: TweetPreviewSectionItem) -> Bool {
    return lhs.identity == rhs.identity
}

// Table section Model
enum TweetPreviewSectionModel {
    case tweet(title: String, items: [TweetPreviewSectionItem])
}

extension TweetPreviewSectionModel: AnimatableSectionModelType {
    typealias Item = TweetPreviewSectionItem

    var items: [Item] {
        switch self {
        case let .tweet(title: _, items: items):

            return items.map { $0 }
        }
    }

    var identity: String {
        switch self {
        case let .tweet(title: title, items: _):

            return title
        }
    }

    init(original: TweetPreviewSectionModel, items: [Item]) {
        self = .tweet(title: original.identity, items: items)
    }
}

