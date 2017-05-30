import Foundation
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

