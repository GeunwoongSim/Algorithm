import Foundation

func solution(_ bin1:String, _ bin2:String) -> String {
    let num1: Int = Int(bin1, radix: 2)!
    let num2: Int = Int(bin2, radix: 2)!
    return String(num1+num2, radix: 2)
}

/*
 이진수를 의미하는 두 개의 문자열 bin1과 bin2가 매개변수로 주어질 때, 두 이진수의 합을 return하도록 solution 함수를 완성해주세요.

 "10", "11" => "101"
 "1001"    "1111"    "11000"
 */
