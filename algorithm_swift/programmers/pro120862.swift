import Foundation

func solution(_ numbers:[Int]) -> Int {
    let maxIndex: Int = numbers.count
    var result: Int = numbers[0]*numbers[1]
    for i in 0..<maxIndex-1 {
        for l in (i+1)..<maxIndex {
            result = max(result,numbers[i]*numbers[l])
        }
    }
    return result
//    let maxIndex: Int = numbers.count
//    let result = numbers.sorted(by: >)
//    return max(result[0]*result[1],result[maxIndex-1]*result[maxIndex-2])
}

/*
 정수 배열 numbers가 매개변수로 주어집니다. numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.
 */
