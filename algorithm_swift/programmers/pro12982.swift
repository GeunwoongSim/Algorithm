import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let arr: [Int] = d.sorted()
    var sum: Int = 0
    for num in arr.enumerated() {
        if sum + num.element <= budget {
            sum += num.element
        }else{
            return num.offset
        }
    }
    return d.count
}
