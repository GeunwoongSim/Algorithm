import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var arr = ArraySlice(my_string)
//    var arr = my_string.map{ String($0) }
    arr.swapAt(num1, num2)
    return arr.map{String($0)}.joined()
}

/*
 문자열 my_string과 정수 num1, num2가 매개변수로 주어질 때,
 my_string에서 인덱스 num1과 인덱스 num2에 해당하는 문자를 바꾼 문자열을 return 하도록 solution 함수를 완성해보세요.
 */
