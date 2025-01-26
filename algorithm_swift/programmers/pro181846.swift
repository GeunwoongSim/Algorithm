import Foundation

func solution(_ a:String, _ b:String) -> String {
    var A: [Int] = a.map{Int(String($0))!}
    var B: [Int] = b.map{Int(String($0))!}
    var pre: Int = 0, num: Int = 0
    var result: [Int] = []
    while !A.isEmpty && !B.isEmpty {
        num = A.popLast()! + B.popLast()! + pre
        pre = num / 10
        num = num % 10
        result.append(num)
    }
    while !A.isEmpty || !B.isEmpty {
        num = (!A.isEmpty ? A.popLast()! : B.popLast()!) + pre
        pre = num / 10
        num = num % 10
        result.append(num)
    }
    if pre != 0 { result.append(pre) }
    return result.reversed().map{String($0)}.joined()
}

/*
 0 이상의 두 정수가 문자열 a, b로 주어질 때, a + b의 값을 문자열로 return 하는 solution 함수를 작성해 주세요.
 "582", "734" => "1316"
 "18446744073709551615", "287346502836570928366" => "305793246910280479981"
 */
