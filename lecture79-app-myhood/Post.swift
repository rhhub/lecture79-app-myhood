//
//  Post.swift
//  lecture79-app-myhood
//
//  Created by Ryan Huebert on 1/21/16.
//  Copyright © 2016 Ryan Huebert. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _postDescription: String
    
    var imagePath: String { return _imagePath }
    var title: String { return _title }
    var postDescription: String { return _postDescription }
    
    init(imagePath: String, title: String, desctiprion: String) {
        _imagePath = imagePath
        _title = title
        _postDescription = desctiprion
    }
    
    
}