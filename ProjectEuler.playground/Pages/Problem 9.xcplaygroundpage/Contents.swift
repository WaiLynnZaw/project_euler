import UIKit
func getProduct(sum: Int) -> Int? {
    let range = Array(1..<sum/2).reversed()
    for z in range {
        for y in range {
            for x in range {
                guard x * x + y * y == z * z && x + y + z == sum else { continue }
                return x * y * z
            }
        }
    }
    return nil
}
print(getProduct(sum: 1000) ?? "can't get")
