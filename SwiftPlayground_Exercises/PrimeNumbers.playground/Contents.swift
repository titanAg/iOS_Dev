import UIKit

func printPrimeNumbers(num1: Int, num2: Int) {
    for i in num1 ... num2 {
        var isPrime: Bool = true;
        for j in 2 ... max(2,i) {
                if (i % j == 0 && i != j || i < 2) {
                    isPrime = false;
                }
            }
        if (isPrime) {
            print(String(i) + " ", terminator: "");
        }
    }
    print("\n", terminator: "\n");
}

func getPrimeNumbers(num1: Int, num2: Int) -> [Int] {
    var primes = [Int]();
    for i in num1 ... num2 {
        var isPrime: Bool = true;
        for j in 2 ... max(2,i) {
                if (i % j == 0 && i != j || i < 2) {
                    isPrime = false;
                }
            }
        if (isPrime) {
            primes.append(i);
        }
    }
    return primes;
}

var PrimeNumbers: (Int, Int) -> [Int] = {
    var primes = [Int]();
    for i in $0 ... $1 {
        var isPrime: Bool = true;
        for j in 2 ... max(2,i) {
                if (i % j == 0 && i != j || i < 2) {
                    isPrime = false;
                }
            }
        if (isPrime) {
            primes.append(i);
        }
    }
    return primes;
}

printPrimeNumbers(num1:1,num2:50);
print(getPrimeNumbers(num1:1,num2:50));
print(PrimeNumbers(1,50));
