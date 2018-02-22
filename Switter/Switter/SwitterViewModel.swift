//
//  SwitterViewModel.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation
import RxSwift

struct SwitterViewModel {

    var dataSource: Observable<[TweetPreviewSectionModel]>
    var repoNameUpdate: Variable<String> = Variable.init("Tesla")

    init(repos: [Tweet]) {
        dataSource = repoNameUpdate.asObservable()
            .flatMap { SwitterViewModel.getRepos(searchQuery: $0) }
            .map { tweets in
                let items = tweets
                    .map { TweetPreviewModel(tweet: $0) }
                    .map { TweetPreviewSectionItem.tweet(presentable: $0) }

                return [TweetPreviewSectionModel.tweet(title: "Tweets", items: items)]
        }
    }

    static func getRepos(searchQuery: String) -> Observable<[Tweet]> {

        let observable = Observable<URL>.create { observer in
            observer.onNext(URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=%23\(searchQuery)")!)
            return Disposables.create()
        }

        return observable
            .map { URLRequest(url: $0) }
            .flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
                return URLSession.shared.rx.response(request: request) }
            .map { response, data -> [Tweet] in
                let decoder = JSONDecoder()
                do {
                    let repos = try decoder.decode([Tweet].self, from: data)

                    return repos
                } catch {
                    print("Error encountered while parsing data. \(error.localizedDescription)")
                }
                return []
        }
    }
}
