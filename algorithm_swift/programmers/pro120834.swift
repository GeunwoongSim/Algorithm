import Foundation

func solution(_ age:Int) -> String {
    //배열에 값을 넣고 확인
    let alpha: [String] = ["a","b","c","d","e","f","g","h","i","j"]
    return String(age).map{ alpha[Int(String($0))!] }.joined()
    
    var result: String = ""
    for num in String(age){
        if num == "0" { result += "a" }
        else if num == "1" { result += "b" }
        else if num == "2" { result += "c" }
        else if num == "3" { result += "d" }
        else if num == "4" { result += "e" }
        else if num == "5" { result += "f" }
        else if num == "6" { result += "g" }
        else if num == "7" { result += "h" }
        else if num == "8" { result += "i" }
        else if num == "9" { result += "j" }
    }
    return result
}

/*
 우주여행을 하던 머쓱이는 엔진 고장으로 PROGRAMMERS-962 행성에 불시착하게 됐습니다.
 입국심사에서 나이를 말해야 하는데, PROGRAMMERS-962 행성에서는 나이를 알파벳으로 말하고 있습니다.
 a는 0, b는 1, c는 2, ..., j는 9입니다.
 예를 들어 23살은 cd, 51살은 fb로 표현합니다.
 나이 age가 매개변수로 주어질 때 PROGRAMMER-962식 나이를 return하도록 solution 함수를 완성해주세요.
 */
