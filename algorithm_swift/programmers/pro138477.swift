import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var top: [Int] = []
    var result: [Int] = []
    
    for idx in 0..<score.count {
        if top.count < k { top.append(score[idx]) }
        else if top.min()! < score[idx] {
            top.removeFirst()
            top.append(score[idx])
        }
        top.sort()
        result.append(top.min()!)
    }
    return result
}
