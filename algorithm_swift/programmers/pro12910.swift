func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result: [Int] = arr.filter{$0%divisor==0}.sorted(by: <)
    return result.count == 0 ? [-1] : result
}
