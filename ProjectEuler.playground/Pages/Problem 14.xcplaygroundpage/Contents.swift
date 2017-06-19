//: [Previous](@previous)

import Foundation



func collatzLength(number:Int, cache: inout [Int]) -> Int {
    var steps = 0
    var n = number

    while n >= cache.count || cache[n] == 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n = (n * 3 + 1) / 2
            steps+=1
        }
        steps+=1
    }

    steps += cache[n]
    cache[number] = steps
    return steps
}

func longestCollatzSequence(maxNumber:Int) -> (number: Int, steps: Int) {
    var collatzSequence = (number:0, steps:0)
    var cache:[Int] = [Int](repeating: 0, count: maxNumber)
    cache[1] = 1

    for number in 2..<maxNumber {
        let steps = collatzLength(number: number, cache:&cache)
        if steps > collatzSequence.steps {
            collatzSequence = (number, steps)
        }
    }

    return collatzSequence
}

//print(longestCollatzSequence(maxNumber: 99999))
