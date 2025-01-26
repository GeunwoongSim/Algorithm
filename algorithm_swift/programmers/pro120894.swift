import Foundation

func solution(_ numbers:String) -> Int64 {
    let dic: [String : String] = [
        "0" : "zero", "1" : "one", "2" : "two", "3" : "three", "4" : "four", "5" : "five", "6" : "six", "7" : "seven", "8" : "eight", "9" : "nine"
    ]
    var str = numbers
    for (n, N) in dic {
        print(N, n)
        str = str.replacingOccurrences(of: N, with: n)
    }
    return Int64(str)!
}

/*
 영어가 싫은 머쓱이는 영어로 표기되어있는 숫자를 수로 바꾸려고 합니다. 문자열 numbers가 매개변수로 주어질 때, numbers를 정수로 바꿔 return 하도록 solution 함수를 완성해 주세요.
 
 "onetwothreefourfivesixseveneightnine" => 123456789
 */
