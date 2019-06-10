//
//  Dynamic.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/8/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    var value: T { didSet {
        listener?(value)
        }
    }
    init(_ v: T) { value = v
    } }
