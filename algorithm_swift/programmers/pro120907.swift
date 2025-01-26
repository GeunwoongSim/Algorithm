import Foundation

func solution(_ quiz:[String]) -> [String] {
    
    return quiz.map{
        let str = $0.components(separatedBy: " ")
        if (str[1] == "+") && ((Int(str[0])!+Int(str[2])!) == Int(str[4])!) { return "O" }
        else if (str[1] == "-") && ((Int(str[0])!-Int(str[2])!) == Int(str[4])!) { return "O" }
        return "X"
    }
    
    
    
    var result: [(String,String)] = []
    quiz.forEach({
        let str = $0.components(separatedBy: " ")
        let num1: Int = Int(str[0])!
        let num2: Int = Int(str[2])!
        str[1] == "+" ? result.append( (String(num1+num2),str[4]) ) : result.append( (String(num1-num2),str[4]) )
    })
    return result.map{ $0 == $1 ? "O" : "X" }
}

/*
 덧셈, 뺄셈 수식들이 'X [연산자] Y = Z' 형태로 들어있는 문자열 배열 quiz가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.
 
 ["19 - 6 = 13", "5 + 66 = 71", "5 - 15 = 63", "3 - 1 = 2"]   =>  ["O", "O", "X", "O"]
 */
