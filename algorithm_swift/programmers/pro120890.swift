import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    print([(3,10),(3,15)].min{ $0 < $1 })
    
    
    return array.min(by: {
        print($0, $1)
        return (abs($0-n),$0) < (abs($1-n), $1)
    })!
    
    
    let arr: [(Int,Int)] = array.sorted().map{
        return($0,abs($0-n))
    }.sorted(by: {$0.1 < $1.1})
    var result: Int = arr[0].0
    for num in arr {
        if num.1 == arr[0].1 {
            result = min(num.0,result)
        }
    }
   return result
}
/*
 정수 배열 array와 정수 n이 매개변수로 주어질 때,
 array에 들어있는 정수 중 n과 가장 가까운 수를 return 하도록 solution 함수를 완성해주세요.
 */
