import Foundation

func solution(_ polynomial:String) -> String {
    let arr = polynomial.components(separatedBy: " + ")
    var withX: Int = 0
    var withoutX: Int = 0
    for str in arr {
        if str.contains("x"){
            if str.count == 1 {
                withX = withX + 1
            }else {
                withX = withX + Int(str.dropLast())!
            }
        }else {
            withoutX = withoutX + Int(str)!
        }
    }
    var result = ""
    if withX != 0 && withoutX != 0{
        result = (withX == 1) ? "x + \(withoutX)" : "\(withX)x + \(withoutX)"
    }else if withX != 0 {
        result = (withX == 1) ? "x" : "\(withX)x"
    }else {
        result = "\(withoutX)"
    }
    return result
}

/*
 한 개 이상의 항의 합으로 이루어진 식을 다항식이라고 합니다. 다항식을 계산할 때는 동류항끼리 계산해 정리합니다.
 
 덧셈으로 이루어진 다항식 polynomial이 매개변수로 주어질 때, 동류항끼리 더한 결괏값을 문자열로 return 하도록 solution 함수를 완성해보세요. 같은 식이라면 가장 짧은 수식을 return 합니다.
 
 "3x + 7 + x" =>   "4x + 7"
 */
