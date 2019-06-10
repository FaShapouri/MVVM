//
//  FavPostView.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/10/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

class FavPostView: PostView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = FavPostVMFromPost()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = FavPostVMFromPost()
    }
}
