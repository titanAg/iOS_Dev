//
//  FirstViewController.swift
//  MyTabBarControllerApp
//
//  Created by cs316 on 2020-02-02.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class FirstViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
  
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
  
    }
}

