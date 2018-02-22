//
//  UserViewController.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
        title  = "Something Big"
    }

}
