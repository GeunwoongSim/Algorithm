import Foundation

func solution(_ num_list:[Int]) -> Int {
    var num1: Int = 0
    var num2: Int = 0
    
    for index in 0..<num_list.count {
        if index%2 == 0 {
            num1 += num_list[index]
        }else {
            num2 += num_list[index]
        }
    }
    return max(num1,num2)
}
/*
 정수 리스트 num_list가 주어집니다. 가장 첫 번째 원소를 1번 원소라고 할 때,
 홀수 번째 원소들의 합과 짝수 번째 원소들의 합 중 큰 값을 return 하도록 solution 함수를 완성해주세요. 두 값이 같을 경우 그 값을 return합니다.
 */
