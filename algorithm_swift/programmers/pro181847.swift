import Foundation

func solution(_ n_str:String) -> String {
//    var result: String = ""
//    var toggle: Bool = true
//    for str in n_str {
//        if str != "0"{
//            toggle = false
//            result += String(str)
//        }
//        else{
//            if !toggle {
//                result += String(str)
//            }
//        }
//    }
    let result: Int = Int(n_str)!
    return String(result)
}

/*
 정수로 이루어진 문자열 n_str이 주어질 때, n_str의 가장 왼쪽에 처음으로 등장하는 0들을 뗀 문자열을 return하도록 solution 함수를 완성해주세요.
 */
