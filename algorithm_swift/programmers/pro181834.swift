import Foundation

func solution(_ myString:String) -> String {
    //map
    return myString.map{ String($0)<"l" ? "l" : String($0) }.joined()
    //일반 반복문
    var result: String = ""
    for str in myString {
        if str < "l" {
            result += "l"
        }else {
            result += String(str)
        }
    }
    return result
    //reduce 활용
    return myString.reduce(""){ $1 < "l" ? $0+"l" : $0+String($1) }
}

/*
 알파벳 소문자로 이루어진 문자열 myString이 주어집니다. 알파벳 순서에서 "l"보다 앞서는 모든 문자를 "l"로 바꾼 문자열을 return 하는 solution 함수를 완성해 주세요.
 */
//"abcdevwxyz"
