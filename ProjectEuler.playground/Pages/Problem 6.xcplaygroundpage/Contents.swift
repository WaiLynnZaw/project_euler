import Foundation
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
