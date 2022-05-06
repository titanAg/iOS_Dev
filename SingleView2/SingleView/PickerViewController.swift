//
//  PickerViewController.swift
//  SingleView
//
//  Created by Kyle on 2022-02-18.
//

import Foundation
import UIKit


class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var place: String?
    var verb: String?
    var number: String?
    
    @IBOutlet weak var picker: UIPickerView!
    private let placesComponent = 0
     private let verbsComponent = 1
    private let numbersComponent = 2
     private let places = ["Kamloops", "Kelowna", "Penticton", "Vernon"]
     private let verbs = ["eat", "play", "drink", "party", "laugh"]
    private let numbers = ["1", "2", "3", "4", "5","6", "7", "8", "9", "10","11", "12", "13", "14", "15","16", "17", "18", "19", "20"]


    
    @IBAction func selectPicker(_ sender: Any) {
        let placesRow = picker.selectedRow(inComponent: placesComponent)
        let verbsRow = picker.selectedRow(inComponent: verbsComponent)
        let numbersRow = picker.selectedRow(inComponent: numbersComponent)
    }
    
    /*
     two methods below need to be implemented for
     UIPickerViewDataSource protocol
     */
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
     // the exact number needs to be determined later
        return 3
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:
    Int) -> Int {
     // the exact number needs to be determined later
        if component == placesComponent {
            return places.count
        } else if component == verbsComponent {
            return verbs.count
        } else {
            return numbers.count
        }
     }
    // one method below need to be implemented for UIPickerViewDelegate
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
    component: Int) -> String? {
     //component string needs to be determined to be returned
        if component == placesComponent {
            return places[row]
        } else if component == verbsComponent {
            return verbs[row]
        } else {
            return numbers[row]
        }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow((places.firstIndex(of: place!) ?? 0), inComponent: 0, animated: false)
        picker.selectRow((verbs.firstIndex(of: verb!) ?? 0), inComponent: 1, animated: false)
        picker.selectRow((numbers.firstIndex(of: number!) ?? 0), inComponent: 2, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VC1 = segue.destination as? ViewController else { return }
        VC1.placeLabel.text = places[picker.selectedRow(inComponent: placesComponent)]
        VC1.verbLabel.text = verbs[picker.selectedRow(inComponent: verbsComponent)]
        VC1.numberLabel.text = numbers[picker.selectedRow(inComponent: numbersComponent)]
    }
}
