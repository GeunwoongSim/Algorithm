import Foundation

func solution(_ s:String) -> [Int] {
    let str: [String] = s.map{ String($0) }
    var result: [Int] = []
    for idx in 0..<s.count {
        let subStr: [String] = s.prefix(idx).map{ String($0) }
        subStr.contains(str[idx]) ? result.append(idx - subStr.lastIndex(of: str[idx])!) : result.append(-1)
    }
    
    return result
}
