import Foundation

func solution(_ topping:[Int]) -> Int {
    var result: Int = 0
    var ADic: [Int:Int] = [:] // 토핑의종류:개수 - 처음에 A에는 토핑이 없기 때문에 빈 딕셔너리
    var BDic: [Int:Int] = [:] // 토핑의종류:개수
    // 처음엔 topping이 전부 들어있음
    topping.forEach{ BDic[$0, default: 0] += 1 }
    
    for topp in topping {
        ADic[topp, default: 0] += 1
        if BDic[topp] == 1 { BDic[topp] = nil } // B에 토핑이 1개면 토핑 종류에서 삭제
        else { BDic[topp]! -= 1 }
        //A에 담긴 종류와 B에 담긴 종류를 비교
        if ADic.count == BDic.count { result += 1 }
    }
    return result
}
