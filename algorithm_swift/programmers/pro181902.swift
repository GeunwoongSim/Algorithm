import Foundation

func solution(_ my_string:String) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: 52)
    let compA: Int = Int(Character("A").asciiValue!)
    let compa: Int = Int(Character("a").asciiValue!)
    for str in my_string{
        let idx: Int = Int(Character(String(str)).asciiValue!)
        if str >= "A" && str <= "Z" {
            result[idx - compA] += 1
        }else {
            result[idx - compa + 26] += 1
        }
    }
    
    return result
}

/*
 알파벳 대소문자로만 이루어진 문자열 my_string이 주어질 때, my_string에서 'A'의 개수, my_string에서 'B'의 개수,..., my_string에서 'Z'의 개수, my_string에서 'a'의 개수, my_string에서 'b'의 개수,..., my_string에서 'z'의 개수를 순서대로 담은 길이 52의 정수 배열을 return 하는 solution 함수를 작성해 주세요.
  
 "Programmers"
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0]
 */
