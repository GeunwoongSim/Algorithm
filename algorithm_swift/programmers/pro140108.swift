import Foundation

func solution(_ s:String) -> Int {
    var value: (Int,Int) = (0,0) // 0: 같은 개수, 1: 다른 개수
    var first: Character? = nil //남은 문자열의 첫 글자
    var result: Int = 0 //문자열 개수
    
    for cha in s {
        if first == nil { first = cha } //첫문자가 지정 안되어있으면 지정
        if first == cha { value.0 += 1} //첫문자와 같은 경우
        else { value.1 += 1 } //첫문자와 다른 경우
        
        if value.0 == value.1 { //두가지 경우의 수가 같은 경우 - 첫문자 새로 지정
            result += 1
            first = nil
        }
    }
    //최종적으로 첫문자가 지정 되어있으면 남은 문자가 있는 상태로 끝난 경우라 +1
    return first == nil ? result : result + 1
    
    
    
    
    
//    return sSplit(s).count
}

func sSplit(_ s: String) -> [String] {
    if s.isEmpty { return [] }
    let first: Character = s.first! //첫번째 문자
    var y: Int = 0 //첫번째 문자와 같은 수
    var n: Int = 0 //첫번째 문자와 같지 않은 수
    
    var str: String = ""
    var left: String = ""
    for cha in s.enumerated() {
        if cha.element == first { y += 1 } //첫번째 문자와 같음
        else { n += 1 } //첫번째 문자와 다름
        str += String(cha.element)
        
        if y == n { break }
    }
    left = String(s.suffix(s.count - str.count))
    return [str] + sSplit(left)
}
