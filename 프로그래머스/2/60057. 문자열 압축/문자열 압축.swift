import Foundation

func solution(_ s:String) -> Int {
    var result: Int = 1001
    var str: [String] = Array(s).map { String($0) }
    // print(str)
    for len in 1...str.count {
        var tempStr: String = ""
        var cStr: [String] = convertStr(str, len)
        
        var preStr: String = ""
        var num: Int = 1
        for value in cStr {
            // print(value, preStr)
            if preStr != value { // 이전 문자와 이번 문자가 다를 경우 - 문자열 저장
                if num != 1 { tempStr += String(num) }
                tempStr += preStr
                num = 1
                preStr = value
            } else {
                num += 1
            }
        }
        if num != 1 { tempStr += String(num) }
        tempStr += preStr
        
        result = min(result, tempStr.count)
        // print("length: \(len), \(tempStr)")
    }
    
    
    return result
}

func convertStr(_ str: [String], _ leng: Int) -> [String] {
    var result: [String] = []
    for (idx, c) in str.enumerated() {
        if idx % leng == 0 { result.append("") }
        result[idx / leng] += c
    }
    
    return result
}