import Foundation
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

