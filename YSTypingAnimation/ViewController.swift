//
//  ViewController.swift
//  YSTypingAnimation
//
//  Created by Cem Olcay on 22/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let dots = YSTypingAnimation()
        dots.center = view.center
        view.addSubview(dots)
    }

}

