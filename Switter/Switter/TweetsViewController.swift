//
//  ViewController.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

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

extension TweetsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.pushViewController(UserViewController(), animated: true)
    }
}

