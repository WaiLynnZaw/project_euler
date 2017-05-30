//: Playground - noun: a place where people can play

import UIKit
import Foundation
/* 
 
 Fibonacci
 
 */
func fibs1(through: Int) -> AnySequence<Int> {
    return sequence(state: (0, 1),
                    next: { (pair: inout (Int, Int)) -> Int? in
                        defer { pair = (pair.1, pair.0 + pair.1) }
                        return pair.1
    }).prefix(while: { $0 <= through })
}
//var result = 0
//fibs1(through: 4000000).forEach {
//    if $0 % 2 == 0 {
//        result += $0
//    }
//}
//print(result)

/* 
 
 Prime Factors

 */

func primeFactorsOf(number: Int) -> [Int] {
    if number < 4 {
        return [number]
    }
    let lim = Int(sqrt(Double(number)))
    for x in 2...lim {
        if number % x == 0 {
            var result = [x]
            result.append(contentsOf: primeFactorsOf(number: number/x))
            return result
        }
    }
    return [number]
}

//print(primeFactorsOf(number: 600851475143))

/* 
 
 Palidrome
 
 */

func isPalindrome(input: Int) -> Bool {
    return input == reversed(input: input)
}

func reversed(input: Int) -> Int {
    var original: Int = input
    var reversed: Int = 0

    while original > 0 {
        reversed *= 10
        reversed += original % 10
        original /= 10
    }

    return reversed
}

func getLargestPalidrome(){
//    let left: Int = 999
//    let right: Int = 999

    var largestPalindrome: Int = 0
    var numbers: String = ""

    for left in stride(from: 999, through: 100, by: -1) {
        for right in stride(from: left, through: 100, by: -1) {
            let product: Int = left * right
            if product > largestPalindrome && isPalindrome(input: product) {
                largestPalindrome = product
                numbers = "Result is \(left) and \(right)"
            }
        }
    }

    print(String(largestPalindrome))
    print(numbers)
}
//getLargestPalidrome()

/*  
 
 Smallest Number Problem 5
 
 */

func greatestCommonDenominator(a: Int, b: Int) -> Int {
    return b == 0 ? a : greatestCommonDenominator(a: b, b: a % b)
}

func leastCommonMultiple(range: [Int]) -> Int {
    return range.reduce(1, { x, y in
        x * (y / greatestCommonDenominator(a: x, b: y))
    })
}

func getSmallestNumber() {
    let answer = leastCommonMultiple(range: Array(1...20))
    print(answer)
}
//getSmallestNumber()


/* 
 
 Diff between Sum of squares and Squares of sum

 
 */

func getSumOfSquares() -> Int{
    var sum = 0
    for i in 1...100 {
        sum += i * i
    }
    return sum
}

func getSquareOfSums() -> Int{
    var sum = 0
    for i in 1...100 {
        sum += i
    }
    return sum * sum
}

//print(getSquareOfSums() - getSumOfSquares())

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
