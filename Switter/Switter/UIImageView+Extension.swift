//
//  UIImageView+Extension.swift
//  Switter
//
//  Created by Vaibhav Singh on 22/02/18.
//  Copyright © 2018 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func addBlur() {
        var blurEffect = UIBlurEffect()
        if #available(iOS 10.0, *) {
            blurEffect = UIBlurEffect(style: .regular)
        } else {
            blurEffect = UIBlurEffect(style: .light)
        }
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.alpha = 0.985
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(effectView)
    }
}
