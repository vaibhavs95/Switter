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

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension TweetsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.pushViewController(UserViewController(), animated: true)
    }
}

