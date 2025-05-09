import Foundation

func solution(_ my_string:String) -> String {
    return my_string.reduce(""){
        if !$0.contains($1){
            return $0+String($1)
        }
        return $0
    }
    
    
    var result: String = ""
    for str in my_string {
        if !result.contains(str) {
            result += String(str)
        }
    }
    
    return result
}

/*
 문자열 my_string이 매개변수로 주어집니다. my_string에서 중복된 문자를 제거하고 하나의 문자만 남긴 문자열을 return하도록 solution 함수를 완성해주세요.
 */
