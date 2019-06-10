//
//  PostVMFromPost.swift
//  PureMVVM
//
//  Created by Fa.Shapouri on 6/10/19.
//  Copyright © 2019 Fa.Shapouri. All rights reserved.
//

import UIKit

class PostViewModelFromPost: PostViewModel {

    private var post: Post!
    let title = Dynamic<String>("")
    let body = Dynamic<String>("")
    let thumbnail = Dynamic<UIImage?>(nil)
    let like = Dynamic<Int>(0)
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let post = Post.init(title: "Salam", body: "common", thumbnail: "https://cdn.time.ir/Content/media/image/2019/03/76_thum.jpeg", like: 0)
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
        //
    }
}
