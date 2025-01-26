import Foundation

func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var result1: String = ""
    for index in 0..<my_strings.count {
        let part: [Int] = parts[index]
        let str: [Character] = Array(my_strings[index])
        
        result1 += str[part[0]...part[1]]
    }
    //String.index 활용
    var result: String = ""
    for str_index in 0..<my_strings.count {
        let part: [Int] = parts[str_index]
        let startIndex: String.Index = my_strings[str_index].index(my_strings[str_index].startIndex, offsetBy: part[0])
        let endIndex: String.Index = my_strings[str_index].index(my_strings[str_index].startIndex, offsetBy: part[1])
        result += my_strings[str_index][startIndex...endIndex]
    }

    return result
}
/*
 길이가 같은 문자열 배열 my_strings와 이차원 정수 배열 parts가 매개변수로 주어집니다.
 parts[i]는 [s, e] 형태로, my_string[i]의 인덱스 s부터 인덱스 e까지의 부분 문자열을 의미합니다.
 각 my_strings의 원소의 parts에 해당하는 부분 문자열을 순서대로 이어 붙인 문자열을 return 하는 solution 함수를 작성해 주세요.
 */

/*
 ["progressive", "hamburger", "hammer", "ahocorasick"]
 [[0, 4], [1, 2], [3, 5], [7, 7]]
 => "programmers"
 */
