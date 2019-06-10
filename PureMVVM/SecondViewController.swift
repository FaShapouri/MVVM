//
//  SecondViewController.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/2/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rview = RecentPostView.init(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 200))
        let fview = FavPostView.init(frame: CGRect(x: 0, y: 220, width: self.view.frame.width, height: 200))
        
        self.view.addSubview(rview)
        self.view.addSubview(fview)
    }
}

