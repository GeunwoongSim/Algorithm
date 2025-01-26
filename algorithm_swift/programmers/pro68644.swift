import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    for idx1 in 0..<(numbers.count-1) {
        for idx2 in (idx1+1)..<numbers.count {
            result.insert(numbers[idx1]+numbers[idx2])
        }
    }
    return result.sorted()
}
