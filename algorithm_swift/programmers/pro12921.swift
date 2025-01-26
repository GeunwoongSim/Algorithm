func solution(_ n:Int) -> Int {
    var arr: [Int] = [Int](repeating: 0, count: n+1)
    for idx1 in 1...n {
        for idx2 in 1...n {
            if idx1*idx2 > n { break }
            arr[idx1*idx2] += 1
        }
    }
    return arr.filter{$0==2}.count
}
