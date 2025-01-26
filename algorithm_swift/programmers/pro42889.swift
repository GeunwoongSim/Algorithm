import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var cur: [Int] = [Int](repeating: 0, count: N+2)
    var arr: [Int] = [Int](repeating: 0, count: N+2)
    stages.forEach{ cur[$0] += 1}
    arr[N+1] = cur[N+1]
    (1...N).reversed().forEach{ arr[$0] = cur[$0] + arr[$0+1] }
    
    return (1...N).map{
        ($0, Double(cur[$0]) / Double(arr[$0]))
    }.sorted(by: { $0.1 > $1.1 }).map{ $0.0 }
    
//    var current: [Int] = [Int](repeating: 0, count: N+2)
//    var arrive: [Int] = [Int](repeating: 0, count: N+2)
//    stages.forEach{ current[$0] += 1 }
//    arrive[N+1] = current[N+1]
//    (1...N).reversed().forEach{ arrive[$0] = current[$0] + arrive[$0+1] }
//    var result: [(String, Double)] = [(String, Double)](repeating: ("",0), count: N+2)
//    
//    for num in 1...N {
//        let d: Double = Double(current[num]) / Double(arrive[num])
//        result[num] = ("\(num)",d)
//    }
//    result.removeFirst()
//    result.removeLast()
//    result.sort(by: {$0.1 > $1.1})
//    return result.map{ Int($0.0)! }
}
