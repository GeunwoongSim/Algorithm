import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.split{ !$0.isNumber }.map{Int(String($0))!}.reduce(0,+)
    
    
    let arr: [String] = my_string.map{ String($0) }
    var result: Int = 0
    var num: Int = 0
    for idx in 0..<arr.count {
        if arr[idx] >= "0" && arr[idx] <= "9" {
            num = num*10 + Int(arr[idx])!
        }else{
            result += num
            num = 0
        }
    }
    return result + num
}

/*
 문자열 my_string이 매개변수로 주어집니다. my_string은 소문자, 대문자, 자연수로만 구성되어있습니다. my_string안의 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
 "aAb1B2cC34oOp" => 37
 */
