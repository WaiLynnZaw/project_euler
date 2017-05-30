import Foundation
func sumOfMultiples(num: Int, divisables: Int...) -> Int {
    var multiples: [Int] = []
    for i in 1..<num {
        if (divisables.filter { i % $0 == 0 }).count > 0 { multiples.append(i) }
    }
    return multiples.reduce(0) { $0 + $1 }

}
print(sumOfMultiples(num: 1000, divisables: 3,5))
