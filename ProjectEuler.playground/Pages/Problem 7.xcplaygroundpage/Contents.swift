import Foundation
func isPrime(number:Int, primes: [Int]) -> Bool {

    let maxPrime = Int(ceil(sqrt(Double(number))))
    for prime in primes {
        if prime > maxPrime {
            break
        }
        if number % prime == 0 {
            return false
        }
    }
    return true
}

func nthPrime(input: Int) -> Int {

    var n = input
    var primes = [2, 3]

    if n <= primes.count {
        return primes[n-1]
    }

    var number = primes.last!
    n -= primes.count

    while n > 0 {
        number += 2
        if isPrime(number: number, primes: primes) {
            primes.append(number)
            n -= 1
        }
    }

    return number
}

//print(nthPrime(input: 10001))
