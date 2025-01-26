import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int{
    let a: [Int] = A.sorted(by: >)
    let b: [Int] = B.sorted(by: <)
    var ans = 0
    for num in zip(a,b){
        ans += num.0 * num.1
    }
    return ans
}
