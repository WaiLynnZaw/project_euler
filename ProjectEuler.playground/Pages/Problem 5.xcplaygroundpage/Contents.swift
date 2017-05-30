import Foundation
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
