import Foundation

func solution(_ binomial:String) -> Int {
    let inp: [String] = binomial.components(separatedBy: " ")
    var result: Int = 0
    guard let num1: Int = Int(inp[0]), let num2: Int = Int(inp[2]) else {
        return 0
    }
    switch inp[1] {
    case "+" :
        result = num1+num2
    case "-" :
        result = num1-num2
    case "*" :
        result = num1*num2
    default :
        return -1
    }
    return result
}

/*
 문자열 binomial이 매개변수로 주어집니다. binomial은 "a op b" 형태의 이항식이고 a와 b는 음이 아닌 정수, op는 '+', '-', '*' 중 하나입니다. 주어진 식을 계산한 정수를 return 하는 solution 함수를 작성해 주세요.
 */
