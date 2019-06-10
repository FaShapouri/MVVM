//
//  FirstViewController.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/2/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var headerLBL: UILabel!
    @IBOutlet var bodyLBL: UILabel!
    @IBOutlet var thumbnail: UIImageView!
    
    var viewModel : PostViewModel! {
        didSet {
            viewModel.title.bindAndFire { [unowned self](value) in
                self.headerLBL.text = value
            }
            viewModel.body.bindAndFire { [unowned self](value) in
                self.bodyLBL.text = value
            }
            viewModel.thumbnail.bindAndFire { [unowned self](image) in
                DispatchQueue.main.async {
                    self.thumbnail.image = image
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = PostViewModelFromPost()
    }


}

