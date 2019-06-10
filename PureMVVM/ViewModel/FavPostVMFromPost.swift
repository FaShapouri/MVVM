//
//  FavPostVMFromPost.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/10/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import Foundation
import UIKit

class FavPostVMFromPost: PostViewModel {
    
    private var post: Post!
    let title = Dynamic<String>("")
    let body = Dynamic<String>("")
    let thumbnail = Dynamic<UIImage?>(nil)
    let like = Dynamic<Int>(0)
    
    init() {
        
        //Here Model view could be initialized to call API to get data of a Model
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let post = Post.init(title: "Fav Post", body: "Most User love this post", thumbnail: "https://www.codeproject.com/KB/GDI-plus/ImageProcessing2/img.jpg", like: 0)
            self.res(post)
        }
    }
    
    func res(_ post: Post) {
        
        self.post = post
        
        self.title.value = post.title
        self.body.value = post.body
        self.thumbnail.value = nil
        
        let downloadTask = URLSession.shared
            .downloadTask(with: URL(string: post.thumbnail)!,
                          completionHandler: { (url, response, error) in
                            if let data = NSData(contentsOf: url!) {
                                if let image = UIImage(data: data as Data) {
                                    self.thumbnail.value = image
                                }
                            }
            })
        
        downloadTask.resume()
        
    }
    
    func increaseLike() {
        self.post.like = self.post.like + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.like.value = self.post.like
        }
    }
}
