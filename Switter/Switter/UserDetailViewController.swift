//
//  UserDetailViewController.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        }
    }
    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.addBlur()
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var favouritesLabel: UILabel!

    private var user: User?

    convenience init(user: User) {
        self.init()

        self.user = user
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavBar()
        
        if let userData = user {
            configure(with: userData)
        } else {
            userNameLabel.text = "No Record Found!!!"
            backgroundImageView.image = nil
            backgroundImageView.backgroundColor = UIColor.darkGray
            for view in [screenNameLabel, locationLabel, languageLabel, tweetCountLabel, followersLabel, favouritesLabel] {
                view?.isHidden = true
            }
        }
    }

    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        title  = "Something Big"
    }

    private func configure(with user: User) {

    }

}
