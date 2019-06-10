//
//  PostViewModel.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/8/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

protocol PostViewModel {
    var title : Dynamic<String> {get}
    var body: Dynamic<String> {get}
    var thumbnail: Dynamic<UIImage?> {get}
    var like: Dynamic<Int> {get}
    func increaseLike()
}

