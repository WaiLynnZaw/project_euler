import Foundation

//func getNumber(){
//    var result = 0
//    var divisors: [Int] = []
//
//    for i in 1...Int.max {
//        result += i
//        for j in 1...result {
//
//            if result % j == 0 {
//                divisors.append(j)
//            }
//
//        }
////        print("\(i)  \(result)   \(divisors)")
//        if (divisors.count > 5) {
//            print("Result = \(result)  and  Divisors = \(divisors)")
//            break
//        }
//        divisors.removeAll(keepingCapacity: true)
//
//    }
//}

//getNumber()

/*
 
 Optimized Version
 
 */


func countDivisors(n : Int) -> Int {
    var n = n
    var numDivisors = 1
    var factor = 2

    while factor * factor <= n {
        if n % factor == 0 {
            var exponent = 0
            repeat {
                exponent += 1
                n /= factor
            } while n % factor == 0
            numDivisors *= exponent + 1
        }
        factor = factor == 2 ? 3 : factor + 2
    }
    if n > 1 {
        numDivisors *= 2
    }

    return numDivisors
}

func getNumber(requiredDivisors : Int) -> Int {

    var n = 1
    while (countDivisors(n: (n+1)/2) * countDivisors(n: n) < requiredDivisors) {
        n += 1;
        if (countDivisors(n: n/2) * countDivisors(n: n+1) >= requiredDivisors) {
            break;
        }
        n += 1;
    }
    let triangleNumber = n*(n+1)/2
    return triangleNumber
}

//print(getNumber(requiredDivisors: 500))


/*
 
    More Optimized Version
 
*/



func getDivisibleNumber(input: Int) {
    var n = 3
    var Dn = 2
    var cont = 0
    let p = 1000
    var n1, Dn1, exponent: Int
    var primeArray = [Int](1...p)

    while cont <= input {
        n = n+1;
        n1 = n;
        if n1 % 2 == 0 {
            n1 = n1/2
        }
        Dn1 = 1;
        for i in 1...p {
            if primeArray[i] * primeArray[i] > n1 {
                Dn1 = 2*Dn1
                break
            }
            exponent = 1

            while n1 % primeArray[i] == 0 {
                exponent += 1;
                n1 = n1/primeArray[i];
            }

            if exponent > 1 {
                Dn1 = Dn1*exponent
            }
            if n1 == 1 {
                break
            }
        }
        cont = Dn*Dn1
        Dn = Dn1
    }
    print(n*(n-1)/2)
}
//getDivisibleNumber(input: 500)
