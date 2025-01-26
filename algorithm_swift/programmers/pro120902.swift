import Foundation

func solution(_ my_string:String) -> Int {
    //문제 맞춤형
    let input: [String] = my_string.components(separatedBy: " ")
    var result: Int = Int(input[0])!
    var idx: Int = 1
    while idx < input.count {
        if input[idx] == "+" { result += Int(input[idx+1])! }
        else { result -= Int(input[idx+1])! }
        idx += 2
    }
    return result
    
    //스택 계산기
    var tempNum: [Int] = []
    var tempSig: [Bool] = []

    for str in my_string.components(separatedBy: " ") {
        if str == "+" { tempSig.append(true) }
        else if str == "-" { tempSig.append(false) }
        else if tempSig.isEmpty { tempNum.append(Int(String(str))!) }
        else{
            var num: Int = tempNum.popLast()!
            num = tempSig.popLast()! ? num + Int(String(str))! : num - Int(String(str))!
            tempNum.append(num)
        }
    }
    return tempNum[0]
}

/*
 my_string은 "3 + 5"처럼 문자열로 된 수식입니다.
 
 
 문자열 my_string이 매개변수로 주어질 때, 수식을 계산한 값을 return 하는 solution 함수를 완성해주세요.
 */
