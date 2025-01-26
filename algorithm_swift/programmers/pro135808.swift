import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let score: [Int] = score.sorted(by: >)
    var result: Int = 0
    for idx in 0..<(score.count/m)*m {
        if idx % m == m-1 {
            result += m * score[idx]
        }
    }
    return result
    
//    let boxs: Int = score.count / m // 사과 몇 상자?
//    let score: [Int] = score.sorted(by: >)[0..<boxs*m].map{Int($0)}
//    return score.enumerated().filter{ $0.offset%m == m-1 }.reduce(0){$0 + $1.element*m}
}
