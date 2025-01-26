import Foundation

func solution(_ n:Int) -> Int {
    
    //1...을 곱해가면서 n보다 커지면 바로 전 값이 가장 큰 수
    var result: Int = 1
    var factorial: Int = 1
    while factorial <= n {
        result += 1
        factorial = factorial * result
    }
    return result - 1
    
    //하나씩 팩토리얼을 구해서 비교
//    func factorial(_ num: Int) -> Int{ // n! = (n-1)! * n
//        if num == 1 { return 1 }
//        return factorial(num-1) * num
//    }
//    var result: Int = 1
//    for idx in 1...n{
//        if factorial(idx) > n {
//            break
//        }else{
//            result = idx
//        }
//    }
//
    return result
}

/*
 i팩토리얼 (i!)은 1부터 i까지 정수의 곱을 의미합니다. 예를들어 5! = 5 * 4 * 3 * 2 * 1 = 120 입니다. 정수 n이 주어질 때 다음 조건을 만족하는 가장 큰 정수 i를 return 하도록 solution 함수를 완성해주세요.

 i! ≤ n
 */
