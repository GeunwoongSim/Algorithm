func solution(_ arr:[Int]) -> [Int] {
    let min: Int = arr.sorted(by: <)[0]
    return arr.count == 1 ? [-1] : arr.filter{$0 != min}
    
    var result: [Int] = arr
    result.remove(at: result.firstIndex(of:arr.min()!)!)
    return result.isEmpty ? [-1] : result
}
