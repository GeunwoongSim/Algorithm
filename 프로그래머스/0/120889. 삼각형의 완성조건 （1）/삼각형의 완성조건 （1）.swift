import Foundation

func solution(_ sides:[Int]) -> Int {
    let sorted: [Int] = sides.sorted()
    return sorted[0]+sorted[1]>sorted[2] ? 1 : 2
}