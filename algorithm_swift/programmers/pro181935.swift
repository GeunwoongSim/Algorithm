import Foundation

func solution(_ n:Int) -> Int {
    return n%2==0 ? (1...n).filter{ return $0%2==0 }.map{$0*$0}.reduce(0,+) : (1...n).filter{ return $0%2==1 }.reduce(0,+)
    
    
    
//    var result: Int = 0
//
//    if n%2==0 { //짝수 n.isMultiple(of: 2)
//        for i in 0...n {
//            if i%2==0 {
//                result += i*i
//            }
//        }
//    }else {
//        for i in 0...n {
//            if i%2==1 {
//                result += i
//            }
//        }
//    }
//    return result
}

/*
 양의 정수 n이 매개변수로 주어질 때, n이 홀수라면 n 이하의 홀수인 모든 양의 정수의 합을 return 하고 n이 짝수라면 n 이하의 짝수인 모든 양의 정수의 제곱의 합을 return 하는 solution 함수를 작성해 주세요.
 */
