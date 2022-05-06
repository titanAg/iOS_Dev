//
//  ViewController.swift
//  SingleView
//
//  Created by Kyle on 2022-02-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var verb: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var template: UITextView!
    @IBOutlet weak var story: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //keyboard dismisal
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        place.delegate = self
        verb.delegate = self
    }
    
    @objc func handleTap() {
        // dismiss keyoard
        place.resignFirstResponder()
        verb.resignFirstResponder()
        number.resignFirstResponder()
    }


    @IBAction func createStory(_ sender: Any) {
        story.text = template.text.replacingOccurrences(of: "<place>", with: place.text ?? "")
        story.text = story.text.replacingOccurrences(of: "<verb>", with: verb.text ?? "")
        story.text = story.text.replacingOccurrences(of: "<number>", with: number.text ?? "")
    }
    
    
}

// https://www.zerotoappstore.com/how-to-hide-keyboard-in-swift-return-key.html#:~:text=If%20you%20have%20a%20UITextField,key%2C%20use%20the%20textFieldShouldReturn%20function.&text=Be%20sure%20you%20have%20set,in%20your%20viewDidLoad()%20function.
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
