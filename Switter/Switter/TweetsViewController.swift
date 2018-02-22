//
//  ViewController.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import UIKit

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

