import Foundation

func dicCompare(_ A:[String:Int], _ B:[String:Int]) -> Bool {
    for dic in A {
        if let value = B[dic.key] {
            if value < A[dic.key]! {
                return false
            }
        } else{
            return false
        }
    }
    return true
}

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result: Int = 0
    var dic: [String:Int] = [:] //사고자 하는 물품과 개수
    for (w,n) in zip(want,number) {
        dic[w] = n
    }
//    print("dic = \(dic)")
    for start in 0...(discount.count-10) {
        var shop: [String:Int] = [:] //할인중인 물품과 개수
        for idx in start..<start+10 { //특정날부터 10일간의 할인 품목 생성
            let obj = discount[idx]
            shop[obj] = (shop[obj] ?? 0) + 1
        }
//        print("shop start = \(start), \(shop)")
        if dicCompare(dic, shop) {
            result += 1
        }
    }
    return result
}

