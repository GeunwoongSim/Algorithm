import Foundation

func solution(_ n:Int) -> Int{
    var num: Int = n+1
    while true {
        if num.nonzeroBitCount == n.nonzeroBitCount { return num }
        num += 1
    }
    
    
    
    
    
    //for문으로 반복돌면 시간초과 나는데 while은 시간내 처리 함
//    let count: Int = String(n, radix: 2).filter{ $0 == "1" }.count
//    var num = n+1
//    while true {
//        let biN: Int = String(num, radix:2).filter{ $0 == "1" }.count
//        if biN == count {
//            return num
//        }
//        num += 1
//    }
}
