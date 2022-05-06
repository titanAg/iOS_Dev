//
//  ViewController.swift
//  SingleView
//
//  Created by Kyle on 2022-02-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var template: UITextView!
    @IBOutlet weak var story: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VC2 = segue.destination as? PickerViewController else { return }
        VC2.place = placeLabel.text
        VC2.verb = verbLabel.text
        VC2.number = numberLabel.text
    }
    
    @IBAction func performUnwindSegueOperation(_ sender: UIStoryboardSegue) {    }

    @IBAction func createStory(_ sender: Any) {
        story.text = template.text.replacingOccurrences(of: "<place>", with: placeLabel.text ?? "")
        story.text = story.text.replacingOccurrences(of: "<verb>", with: verbLabel.text ?? "")
        story.text = story.text.replacingOccurrences(of: "<number>", with: numberLabel.text ?? "")
    }
    
    
}
