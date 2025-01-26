import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int:Int] = [:]
    tangerine.forEach{ dic[$0, default: 0] += 1 }
    let tuples = dic.sorted(by: { $0.value > $1.value })
    var sum: Int = 0
    for (i, tuple) in tuples.enumerated() {
        sum += tuple.value
        if sum >= k { return i+1 }
    }
    return -1
}

//func solution(_ k:Int, _ tangerine:[Int]) -> Int {
//    var dic: [Int:Int] = [:]
//    for tang in tangerine {
//        guard let _ = dic[tang] else {
//            dic[tang] = 1
//            continue
//        }
//        dic[tang]! += 1
//    }
//    let tuples = dic.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value })
//    var sum: Int = 0
//    for (i, tuple) in tuples.enumerated() {
//        sum += tuple.value
//        if sum >= k {
//            return i+1
//        }
//    }
//    return -1
//}
