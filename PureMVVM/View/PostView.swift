//
//  PostView.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/10/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit


class PostView: UIView, NibLoadable {

    @IBOutlet var headerLBL: UILabel!
    @IBOutlet var bodyLBL: UILabel!
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var likeBtn: UIButton!
    
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
            viewModel.like.bindAndFire { (like) in
                self.likeBtn.setTitle("like: \(like)", for: .normal)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    @IBAction func likeButtonDidSelect(_ sender: Any) {
        viewModel.increaseLike()
    }

}
