//
//  ViewController.swift
//  CollegeTableViewDB
//
//  Created by Kyle on 2022-03-05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var databasePath = String()
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var program: UITextField!
    @IBOutlet weak var average: UITextField!
    @IBOutlet weak var status: UITextField!
    @IBOutlet weak var btn_find: UIButton!
    @IBOutlet weak var btn_action: UIButton!
    
    var selection: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btn_action.setTitle(selection, for: .normal)
        
        
        if (selection!.starts(with: "Add")) {
            btn_find.isHidden = true
        }
        if (selection!.starts(with: "Find")) {
            btn_action.isHidden = true
        }
        
        self.id.delegate = self
        self.name.delegate = self
        self.program.delegate = self
        self.average.delegate = self
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathComponent("students.db").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
           let studentDB = FMDatabase(path: databasePath as String)
        
        
        if (studentDB.open()) {
        let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS (ID INTEGER PRIMARY KEY, NAME TEXT, PROGRAM TEXT, AVERAGE TEXT)"
        
        if !(studentDB.executeStatements(sql_stmt)) { print("Error: \(studentDB.lastErrorMessage())")
        }
        studentDB.close() } else {
        print("Error: \(studentDB.lastErrorMessage())") }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func findBtnClick(_ sender: Any) {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()) {
            let querySQL = "SELECT name, program, average FROM STUDENTS WHERE id = '\(id.text!)'"
            let results:FMResultSet? = studentDB.executeQuery(querySQL, withArgumentsIn: [])
            if results?.next() == true {
                name.text = results?.string(forColumn: "name")
                program.text = results?.string(forColumn: "program")
                average.text = results?.string(forColumn: "average")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                id.text = ""
                name.text = ""
                program.text = ""
                average.text = ""
            }
            studentDB.close() }
        else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    @IBAction func actionBtnClick(_ sender: Any){
        let studentDB = FMDatabase(path: databasePath as String)
        
        if (selection!.starts(with: "Add")) {
            if (studentDB.open()){
                let insertSQL = "INSERT INTO STUDENTS (id, name, program, average) VALUES ('\(id.text!)', '\(name.text!)', '\(program.text!)', '\(average.text!)')"
                let result = studentDB.executeUpdate(insertSQL, withArgumentsIn: [])
                if !result {
                    status.text = "Failed to add student"
                    print("Error:\(studentDB.lastErrorMessage())")
                } else {
                    status.text = "Student Added"
                    id.text = ""
                    name.text = ""
                    program.text = ""
                    average.text = ""
                }
            } else {
                print("Error: \(studentDB.lastErrorMessage())")
            }
        }
        else if (selection!.starts(with: "Update")) {
            if (studentDB.open()) {
                let updateSQL = "UPDATE STUDENTS set name = '\(name.text!)', program = '\(program.text!)', average = '\(average.text!)' WHERE id = '\(id.text!)'"
                let result = studentDB.executeUpdate(updateSQL, withArgumentsIn: [])
                if !result {
                    status.text = "Failed to update student"
                    print("Error: \(studentDB.lastErrorMessage())")
                } else {
                    status.text = "Student Updated"
                    id.text = ""
                    name.text = ""
                    program.text = ""
                    average.text = ""
                }
                studentDB.close() }
            else {
                print("Error: \(studentDB.lastErrorMessage())")
            }
        }
        else if (selection!.starts(with: "Delete")){
            if (studentDB.open()) {
                let deleteSQL = "DELETE FROM STUDENTS WHERE id = '\(id.text!)'"
                let result = studentDB.executeUpdate(deleteSQL, withArgumentsIn: [])
                if !result {
                    status.text = "Failed to delete student"
                    print("Error: \(studentDB.lastErrorMessage())") } else {
                    status.text = "Student deleted"
                    id.text = ""
                    name.text = ""
                    program.text = ""
                    average.text = ""
                }
                studentDB.close()
            } else {
                print("Error: \(studentDB.lastErrorMessage())")
            }
        }
    
    }
}


