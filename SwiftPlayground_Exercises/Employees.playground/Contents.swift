// Kyle Orcutt
// COSC 316 iOS Dev
// Lab 3

import UIKit
import Foundation

let C_FORMATTER = NumberFormatter()
C_FORMATTER.usesGroupingSeparator = true
C_FORMATTER.numberStyle = .currency
C_FORMATTER.locale = Locale.current

var currency: (Double) -> String = { C_FORMATTER.string(from: NSNumber(value: $0)) ?? "" }


class Employee {
    var name: String
    var id: String
    var jobTitle: String
    var yearsOfService: Int
    
    init (name: String, id: String, jobTitle: String, yearsOfService: Int) {
        self.name = name
        self.id = id
        self.jobTitle = jobTitle
        self.yearsOfService = yearsOfService
    }
    
    func pay () -> Double {
        return 100.0
    }
    
    func toString() -> String {
        let s: String = self.jobTitle == "Volunteer Worker" ?
            String(format: "Reimbersement Amount: %@\nThank you for your volunteer work and time!", currency(self.pay())) : ""
            
        return String(format: "Name: %@\nID: %@\nTitle: %@\nYears of Service: %d\n%@", self.name, self.id, self.jobTitle, self.yearsOfService, s)
    }
}

class SalaryEmployee: Employee {
    var annualSalary: Double

    init (name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double)
    {
        self.annualSalary = annualSalary
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
        
    }
    
    override func pay() -> Double {
        return self.annualSalary/26;
    }
    
    override func toString() -> String {
        return String(format: "%@Annual Salary: %@\nPaycheck Amount: %@",super.toString(), currency(self.annualSalary), currency(self.pay()))
    }
}

class HourlyEmployee: Employee{
    var hourlyRate: Double
    var hoursWorked: Double
    
    init (name: String, id: String, jobTitle: String, yearsOfService: Int, hourlyRate: Double, hoursWorked: Double)
    {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
        
    }
    
    override func pay() -> Double {
        return self.hoursWorked <= 80 ?
            self.hourlyRate * self.hoursWorked :
            (self.hourlyRate * 80.0 + self.hourlyRate * (self.hoursWorked - 80.0) * 1.5)
    }
    
    override func toString() -> String {
        return String(format: "%@Hourly Rate: %@\nHours Worked: %.1f\nPaycheck Amount: %@",super.toString(), currency(self.hourlyRate), self.hoursWorked, currency(self.pay()))
    }
}

class Executive: SalaryEmployee {
    var bonus: Double
    
    override init (name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double)
    {
        self.bonus = 0.0
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService, annualSalary: annualSalary)
    }
    
    override func pay() -> Double {
        return self.bonus + super.pay()
    }
    
    override func toString() -> String {
        return String(format: "%@\nBonus Awarded: %@",super.toString(), currency(self.bonus))
    }
}

var emp1 = Employee(name:"Peter Long", id:"112-22-3011", jobTitle:"Volunteer Worker",
yearsOfService:5)
 print (emp1.toString())
 print("---------------------------------------------------------")

var emp2 = SalaryEmployee(name:"Martine Short", id:"116-23-6418", jobTitle:"Manager",
yearsOfService:8, annualSalary: 78600.00)
 print (emp2.toString())
 print("---------------------------------------------------------")

var emp3 = HourlyEmployee(name:"Susan Johnson", id:"123-32-3515", jobTitle:"Receptionist",
 yearsOfService:10, hourlyRate: 16, hoursWorked: 84)
 print(emp3.toString())
 print("-------------------------------------------------------")

var emp4 = HourlyEmployee(name:"Paul Simon", id:"133-53-4019", jobTitle:"System Support Analyst",
 yearsOfService:4, hourlyRate: 22.0, hoursWorked: 75)
print(emp4.toString())
print("-------------------------------------------------------")

var emp5 = Executive(name: "Steve Job", id: "111-22-3333", jobTitle: "CEO", yearsOfService: 25,
annualSalary: 1000000.0)
print (emp5.toString())
print ("\n----------------------------------------------------")
print ("3% bonus to be awarded for this paycheck:\n")
emp5.bonus = emp5.pay() * 0.03
print (emp5.toString())
print ("-------------------------------------------------------")

var emps: [Employee] = [emp1, emp2, emp3, emp4, emp5]
print("\n\nprinting all employees using an array!\n")
for emp in emps {
    print(emp.toString())
    print("-------------------------------------------------------")
}


var emps_dict: [String:Employee] = [:]
emps_dict[emp1.id] = emp1
emps_dict[emp2.id] = emp2
emps_dict[emp3.id] = emp3
emps_dict[emp4.id] = emp4
emps_dict[emp5.id] = emp5

print("\n\nprinting all employees using a dictionary!\n")
for emp in emps_dict {
    print(emp.value.toString())
    print("-------------------------------------------------------")
}
