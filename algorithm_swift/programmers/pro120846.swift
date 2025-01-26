import Foundation

func solution(_ n:Int) -> Int {
    //브루트포스
    var result: Int = 0
    for num in 1...n{
        var cal: Int = 0
        for index in 1...num{
            if num%index == 0 {
                cal += 1
            }
        }
        if cal > 2 {
            result += 1
        }
    }
    return result
    //소수가 아니면 합성수
//    var arr: [Int] = Array(repeating: 1, count: 101)
//    let numbers: [Int] = [2,3,5,7,11]
//    for num in numbers {
//        var idx: Int = 2
//        while num * idx < 101 {
//            arr[num * idx] = 0
//            idx += 1
//        }
//    }
//    return arr.enumerated().filter({ $0.offset <= n && $0.element == 0}).map{ $0.offset }.count
}

/*
 약수의 개수가 세 개 이상인 수를 합성수라고 합니다. 자연수 n이 매개변수로 주어질 때 n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.
 */
