import Foundation

func solution(_ s:String) -> [Int] {
    var s: String = s
    var number: Int = 0 //변환 횟수
    var removeNumber: Int = 0 //0을 제거한 개수
    
    while s != "1" {
        removeNumber += s.filter{ $0 == "0" }.count // 제거할 0의 개수
        s = String(s.replacingOccurrences(of: "0", with: "").count,radix:2) // 0을 제거하고 나온 문자열의 길이를 2진수로 변환
        number += 1
    }
    return [number,removeNumber]
}
