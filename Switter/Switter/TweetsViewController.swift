//
//  ViewController.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class TweetsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!{
        didSet {
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
            tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: String(describing: TweetTableViewCell.self))
        }
    }

    let searchField = UISearchBar()
    private var viewModel: SwitterViewModel!
    private var dataSource: RxTableViewSectionedAnimatedDataSource<TweetPreviewSectionModel>?
    private var disposeBag = DisposeBag()

    convenience init(viewModel: SwitterViewModel) {
        self.init()

        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchField.delegate = self
        navigationItem.titleView =  searchField
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavBar()
    }

    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }

    private func setupTableView() {
        let dataSource = TweetsViewController.animatedDatasource()
        self.dataSource = dataSource

        viewModel.dataSource
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension TweetsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension TweetsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let existingQuery = searchBar.text as NSString? else {return false}
        let updatedString = existingQuery.replacingCharacters(in: range, with: text)

        return updatedString.count <= 500 //Twitter's search query's max limit
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.pushViewController(UserDetailViewController(), animated: true)
    }
}

extension TweetsViewController {

    static func animatedDatasource() -> RxTableViewSectionedAnimatedDataSource<TweetPreviewSectionModel> {
        return RxTableViewSectionedAnimatedDataSource(
            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                           reloadAnimation: .none,
                                                           deleteAnimation: .left),
            configureCell: { (dataSource, table, indexPath, item) in
                switch item {
                case let .tweet(presentable):
                    let cell: TweetTableViewCell = table.dequeueReusableCell(withIdentifier: String(describing: TweetTableViewCell.self), for: indexPath) as! TweetTableViewCell

                    cell.configure(tweet: presentable)
                    return cell
                }
        })
    }
}

