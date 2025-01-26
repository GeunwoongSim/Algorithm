import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    var temp: String = my_str
    var result: [String] = []
    while temp.count > n {
        var str: String = ""
        for _ in 0..<n{
            str += String(temp.removeFirst())
        }
        result.append(str)
    }
    result.append(temp)
    return result
}

/*
 문자열 my_str과 n이 매개변수로 주어질 때, my_str을 길이 n씩 잘라서 저장한 배열을 return하도록 solution 함수를 완성해주세요.
 
 "abc1Addfggg4556b", 6 => ["abc1Ad", "dfggg4", "556b"]
 */
