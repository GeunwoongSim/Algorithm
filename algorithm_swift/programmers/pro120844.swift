import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    //굳이 num을 만들지 않고 바로 해도 됨
    var result: [Int] = numbers
    direction == "left" ? result.append( result.removeFirst()) : result.insert(result.popLast()!, at: 0)
    
    return result
//    var result = numbers
//    if direction == "left" {
//        let num = result.removeFirst()
//        result.append(num)
//    }else {
//        let num = result.popLast() ?? 0
//        result.insert(num, at: 0)
//    }
//    return result
}

/*
 정수가 담긴 배열 numbers와 문자열 direction가 매개변수로 주어집니다.
 배열 numbers의 원소를 direction방향으로 한 칸씩 회전시킨 배열을 return하도록 solution 함수를 완성해주세요.
 */
