func solution(_ n:Int) -> Int {
    if n == 1 { return 1 }
    else if n == 2 { return 2 }
    var map: [Int] = [Int](repeating: 0, count: n+1)
    map[1...2] = [1,2]
    for idx in 3...n {
        map[idx] = (map[idx-2] + map[idx-1]) % 1234567
    }
    return map[n]
}
