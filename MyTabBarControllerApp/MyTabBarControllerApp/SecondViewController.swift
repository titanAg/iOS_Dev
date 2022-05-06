//
//  SecondViewController.swift
//  MyTabBarControllerApp
//
//  Created by cs316 on 2020-02-02.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var siteView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "http://127.0.0.1:5500/userlogin.html")
        let request = URLRequest(url: url!)
        siteView.loadRequest(request)
    }
}

