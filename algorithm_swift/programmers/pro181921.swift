import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    let re = (l...r).filter{ String($0).allSatisfy({$0 == "0" || $0 == "5"})}
    return re.count == 0 ? [-1] : re
    
    
    //filter map 활용
    let arr = (l...r).filter{ String($0).filter{ $0 == "0" || $0 == "5" }.count == String($0).count }
    return arr.count == 0 ? [-1] : arr
    
    
    var result: [Int] = []
    for num in l...r {
        let str = String(num)
        let count = str.filter{ $0 == "0" || $0 == "5"}.count
        if count == str.count { result.append(num) }
    }
    return result.count == 0 ? [-1] : result
}

/*
 정수 l과 r이 주어졌을 때, l 이상 r이하의 정수 중에서 숫자 "0"과 "5"로만 이루어진 모든 정수를 오름차순으로 저장한 배열을 return 하는 solution 함수를 완성해 주세요.

 만약 그러한 정수가 없다면, -1이 담긴 배열을 return 합니다.
 5    555  =>  [5, 50, 55, 500, 505, 550, 555]
 10    20  =>  [-1]
 */
