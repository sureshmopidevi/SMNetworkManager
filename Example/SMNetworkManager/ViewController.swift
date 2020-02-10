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
        SMNetworkManager.headers = [:]
        var request = ReqClass()
        request.category = ""
        request.country = "IN"
        request.page = "1"
        request.pageSize = "10"
        
        self.fetch(url: "", request: request, responseType: BaseClass.self, paramEncoding: .default) { (response) in
            print(response)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

