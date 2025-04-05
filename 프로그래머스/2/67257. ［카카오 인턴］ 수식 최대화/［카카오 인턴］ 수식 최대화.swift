import Foundation

func solution(_ expression:String) -> Int64 {
    var result: Int64 = 0
    // 수식 배열
    let expression = inputToArr(expression)
    // 연산자의 우선순위 (+, -, *) 3! = 6(가지 경우) - 앞에서 부터 먼저 계산
    let priorityInfos: [[String]] = [
        ["+", "-", "*"],
        ["+", "*", "-"],
        ["-", "+", "*"],
        ["-", "*", "+"],
        ["*", "+", "-"],
        ["*", "-", "+"]
    ]
    
    for info in priorityInfos {
        let number: Int64 = calculate(
            expression: expression, 
            priority: info
        )
        result = max(result, number)
    }
    
    return result
}

// 수식과 우선순위를 전달하면 결과값(절대값)을 반환
func calculate(expression: [String], priority: [String]) -> Int64 {
    
    var expression = expression
    for oper in priority {
        var stack: [String] = []
        var idx: Int = 0
        
        while idx < expression.count {
            if expression[idx] == oper {
                let num1: String = stack.popLast()!
                let num2: String = expression[idx+1]
                var num3: Int64 = 0
                if oper == "+" { num3 = Int64(num1)! + Int64(num2)! }
                else if oper == "-" { num3 = Int64(num1)! - Int64(num2)! }
                else if oper == "*" { num3 = Int64(num1)! * Int64(num2)! }
                stack.append(String(num3))
                idx += 1
            } else {
                stack.append(expression[idx])
            }
            idx += 1
        }
        expression = stack
    }
    let result = Int64(expression[0])!
    
    return result < 0 ? -result : result
}

// 입력된 String을 배열에 담아서 반환
func inputToArr(_ expression: String) -> [String] {
    var result: [String] = []
    
    var flag: Bool = true // 이전이 연산자였는가
    
    for char in expression {
        let str = String(char)
        if str == "+" || str == "-" || str == "*" {
            result.append(str)
            flag = true
        } else {
            if flag {
                result.append(str)
            } else {
                result[result.count-1] += str
            }
            flag = false
        }
    }
    
    return result
}