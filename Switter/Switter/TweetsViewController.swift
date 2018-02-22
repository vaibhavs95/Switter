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
        
        self.navigationItem.titleView =  searchField
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

