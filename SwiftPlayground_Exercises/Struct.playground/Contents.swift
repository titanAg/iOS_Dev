// Kyle Orcutt COSC 316 Lab 2
import UIKit

struct Employee {
    let name: String?
    let id: String?
    let jobTitle: String?
    let yearOfService: Int?
    let annualSalary: Double?
    
    init (name: String? = nil, id: String? = nil, title: String? = nil, year: Int? = nil, salary: Double? = nil) {
        self.name = name
        self.id = id
        jobTitle = title
        yearOfService = year
        annualSalary = salary
    }
}

var employees: [Employee] = []
employees.append(Employee(name:"Peter Long", id: "112-22-3011", title: "Volunteer Worker", year: 5, salary: 1200.0))
employees.append(Employee(name:"Martine Short", id: "116-23-6418", title: "Manager", year: 8, salary: 78600.0))
employees.append(Employee(name:"Susan Johnson", id: "123-32-3515", title: "Receptionist", year: 10, salary: 38600.0))
employees.append(Employee(name:"Paul Simon", id: "133-53-4019", title: "System Support Analyst", year: 8, salary: 65000.0))

for emp in employees {
    print(String(format:"%@\t\t\t%@\t\t\t%@", emp.name!, emp.id!, emp.jobTitle!))
}

func highestSalary(emps: [Employee]) -> Employee {
    var best:Employee = emps[0]
    for emp in emps {
        if (emp.annualSalary! >  best.annualSalary!) {
            best = emp
        }
    }
    return best
}
print()
print("Highest paid employee: ", highestSalary(emps: employees))
print()


var dict_employees: [String:Employee] = [:]


for emp in employees {
    dict_employees[emp.id!] = emp
}

for emp in dict_employees {
    print(String(format: "%@\t\t\t%@\t\t\t%@",emp.value.name!,emp.value.id!, emp.value.jobTitle!))
}

func highestSalary(emps: [String:Employee]) -> Employee {
    var best:Employee = emps.values.first!
    for emp in emps {
        if (emp.value.annualSalary! > best.annualSalary!) {
            best = emp.value
        }
    }
    return best
}
print()
print("Highest paid employee: ", highestSalary(emps: dict_employees))

