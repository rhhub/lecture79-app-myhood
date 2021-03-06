//
//  ViewController.swift
//  lecture79-app-myhood
//
//  Created by Ryan Huebert on 1/21/16.
//  Copyright © 2016 Ryan Huebert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var posts = [Post]() Used for test data

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // tableView.estimatedrowheight
    
//      TEST DATA
//        for var i in 0...10 {
//            let title = "Post \(i)"
//            
//            var description = ""
//            for _ in 0...i {
//                description = description + "This is post \(i). "
//            }
//            
//            posts.append(Post(imagePath: "", title: title, desctiprion: description))
//        }
        
        DataService.instance.loadPosts() // I think it "reloads data" once after viewDidLoad() so this line can be before the following.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notification: AnyObject) {
        tableView.reloadData()
    }
    

}

