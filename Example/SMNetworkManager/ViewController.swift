//
//  ViewController.swift
//  SMNetworkManager
//
//  Created by iosdevsureshmopidevi@gmail.com on 02/10/2020.
//  Copyright (c) 2020 iosdevsureshmopidevi@gmail.com. All rights reserved.
//

import UIKit
import SMNetworkManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var request = ReqClass()
        request.category = "Sports"
        request.country = "IN"
        request.page = "1"
        request.pageSize = "10"
        SMNetworkManager.headers = [:]
        let API:String = "https://jsonplaceholder.typicode.com/posts"
        self.backgroundQueue {
            self.fetch(url:API,method: .get,request: request, responseType: [FakeAPIPostsResponse].self) { (model,response)  in
                print(response)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/*
 [![CI Status](https://img.shields.io/travis/iosdevsureshmopidevi@gmail.com/SMNetworkManager.svg?style=flat)](https://travis-ci.org/iosdevsureshmopidevi@gmail.com/SMNetworkManager)
 */
