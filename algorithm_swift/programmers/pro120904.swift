import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    //firstIndex 활용
    guard let result: Int = String(num).map({ Int(String($0))! }).firstIndex(of: k) else {
        return -1
    }
    return result
    
    
    for str in String(num).enumerated() {
        if String(str.element) == String(k) {
            return str.offset + 1
        }
    }
    return -1
}

/*
 정수 num과 k가 매개변수로 주어질 때, num을 이루는 숫자 중에 k가 있으면 num의 그 숫자가 있는 자리 수를 return하고 없으면 -1을 return 하도록 solution 함수를 완성해보세요.
 */
