//
//  RecentPostView.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/10/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

class RecentPostView: PostView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = RecentPostVMFromPost()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = RecentPostVMFromPost()
    }
}
