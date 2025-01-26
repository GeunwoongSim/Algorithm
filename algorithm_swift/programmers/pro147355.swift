import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var result: [Int] = []
    
    let arr = Array(t)
    for idx in 0...(t.count-p.count) {
        let number: Int = Int(arr[idx..<(idx+p.count)].map{ String($0) }.joined())!
        result.append(number)
    }
    return result.filter{ $0<=Int(p)! }.count
    
    
    for idx in 0...(t.count-p.count) {
        result.append(Int(t.prefix(t.count-idx).suffix(p.count))!)
    }
    return result.filter{ $0<=Int(p)! }.count
}


/*
 arr = Array(t)
 for idx in 0...(t.count-p.count) {
     let number: Int = Int(arr[idx..<(idx+p.count)].map{ String($0) }.joined())!
    
 }
 */
