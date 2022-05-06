//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by Kyle on 2022-02-17.
//

import UIKit

class FirstViewController: UIViewController {


    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var msg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self // set delegate
        msg.adjustsFontSizeToFitWidth = true
        msg.minimumScaleFactor = 0.5
    }

    override func viewDidDisappear(_ animated: Bool) { //or using viewWillDisappear function
         if let secondTab = self.tabBarController!.viewControllers![1] as? SecondViewController {
                let formatter = DateFormatter()
                 formatter.dateStyle = .long
                 formatter.timeStyle = .short
                 let dateString = formatter.string(from: datepicker.date)
               secondTab.msg.text = "Hey, " + self.name.text! + "!" +
                                    " Your next appointment is on " + dateString
         }
     }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
