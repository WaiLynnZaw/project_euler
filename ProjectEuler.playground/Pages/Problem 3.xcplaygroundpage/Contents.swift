import Foundation

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
