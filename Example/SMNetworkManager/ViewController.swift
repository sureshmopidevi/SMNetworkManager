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
        
        
        let button: UIButton = {
            let button = UIButton(frame: .zero)
            button.titleLabel?.text  = "hey tere"
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        button.addTarget(self, action: #selector(trigger), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.backgroundColor = .black

    }

    @objc func trigger() {
        var request = ReqClass()
        request.category = "Sports"
        request.country = "IN"
        request.page = "1"
        request.pageSize = "10"
        SMNetworkManager.headers = [:]
        let API: String = "https://jsonplaceholder.typicode.com/posts"
        self.errorAlert(title: "Edhi da title", description: "Lets do this", alertType: .promtWithReportToDeveloper(action1TItle: "OK", action2Title: "report", completion: {
            self.backgroundQueue {
                self.fetch(url: API, request: request, responseType: [FakeAPIPostsResponse].self) { response in
                    response.forEach { apiResponse in
                        print(apiResponse.title ?? "")
                    }
                }
            }
        }))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

/*
 [![CI Status](https://img.shields.io/travis/iosdevsureshmopidevi@gmail.com/SMNetworkManager.svg?style=flat)](https://travis-ci.org/iosdevsureshmopidevi@gmail.com/SMNetworkManager)
 */
