import Foundation

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
//
//func getSumOfPrime(input: Int) {
//    var sum: Int = 0
//    for i in 1...input {
//        if isPrime(i) {
//            sum += i
//        }
//    }
//    print("Sum of primes = \(sum)")
//}
//getSumOfPrime(input: 200000)

// The playground stop :)


func getPrimes(input: Int) -> [Int] {
    var numbers = Array(2...input)
    var primes: [Int] = []
    while numbers.count > 0 {
        guard let number = numbers.first else { break }
        numbers.removeFirst()
        if isPrime(number) {
            primes.append(number)
            numbers = numbers.filter { $0 % number != 0 }
        }
    }
    return primes
}

func getSumOfPrimes(input: Int) -> Int {
    return getPrimes(input: input).reduce(0, +)
}
// still not ok

//print("Sum of primes = \(getSumOfPrimes(input: 2000000))")




