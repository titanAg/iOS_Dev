//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by Kyle on 2022-02-17.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var msg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.delegate = self // set deligate
        msg.adjustsFontSizeToFitWidth = true
        msg.minimumScaleFactor = 0.5
        
    }
    
    override func viewDidDisappear(_ animated: Bool) { //or using viewWillDisappear function
         if let firstTab = self.tabBarController!.viewControllers![0] as? FirstViewController {
            firstTab.msg.text = "Okay, " + (self.name.text == "" ? "nobody" : self.name.text)! + "!"
         }
     }

}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
