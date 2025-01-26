import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var map: [Bool] = [Bool](repeating: true, count: n)
    for num in section {
        map[num-1] = false
    }
    var result: Int = 0
    for idx1 in 0..<map.count {
        if !map[idx1] {
            for idx2 in 0..<m where (idx1+idx2)<n {
                map[idx1+idx2] = true
            }
            result += 1
        }
    }
    
    
    return result
}
