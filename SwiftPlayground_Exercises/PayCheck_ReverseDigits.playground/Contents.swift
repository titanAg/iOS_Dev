import UIKit

func payCheck(_ name: String, _ hoursWorked: Double, _ hourlyRate: Double, _ bonus: Double = 0) -> String {
    var overtime: Double = 0.0
    if (hoursWorked > 80) {
        overtime = hoursWorked - 80
    }
    var check: Double = (hoursWorked * hourlyRate) + (overtime * hourlyRate*0.5) + bonus
    return String(format: "%@: $%.2f", name, check)
}

print(payCheck("John Doe", 70.5, 21.5, 150.0))
print(payCheck("Peter Chan", 88.5, 20.0) + "\n")

func reverseDigits(_ num: Int, _ reversedStr: String) -> String {
    if (num == 0) {
        return reversedStr.isEmpty ? String(num) : reversedStr
    }
    var temp: String = reversedStr
    if (num < 0 && reversedStr.isEmpty) {
        temp = "-"
    }
    return reverseDigits(Int(num/10),temp + String(num).suffix(1))
}

print(reverseDigits(1234,""))
print(reverseDigits(-1230,""))
print(reverseDigits(0,""))
