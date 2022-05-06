//Kyle Orcutt COSC 316 Lab 2
import UIKit

typealias Employee = (name: String, id: String, jobtitle: String, yearOfService: Int, annualsalary: Double)

var employees: [Employee] = [
    Employee(name:"Peter Long", id: "112-22-3011", jobtitle: "Volunteer Worker", yearOfService: 5, annualsalary: 1200.0),
    Employee(name:"Martine Short", id: "116-23-6418", jobtitle: "Manager", yearOfService: 8, annualsalary: 78600.0),
    Employee(name:"Susan Johnson", id: "123-32-3515", jobtitle: "Receptionist", yearOfService: 10, annualsalary: 38600.0),
    Employee(name:"Paul Simon", id: "133-53-4019", jobtitle: "System Support Analyst", yearOfService: 8, annualsalary: 65000.0)
]

for emp in employees {
    print(String(format: "%@\t\t\t%@\t\t\t%@",emp.name,emp.id, emp.jobtitle))
}

func highestSalary(emps: [Employee]) -> Employee {
    var best:Employee = emps[0]
    for emp in emps {
        if (emp.annualsalary > best.annualsalary) {
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
    dict_employees[emp.id] = emp
}

for emp in dict_employees {
    print(String(format: "%@\t\t\t%@\t\t\t%@",emp.value.name,emp.value.id, emp.value.jobtitle))
}

func highestSalary(emps: [String:Employee]) -> Employee {
    var best:Employee = emps.values.first!
    for emp in emps {
        if (emp.value.annualsalary > best.annualsalary) {
            best = emp.value
        }
    }
    return best
}
print()
print("Highest paid employee: ", highestSalary(emps: dict_employees))
