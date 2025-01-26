func solution(_ n:Int) -> Int {
    var fibo: [Int] = [Int](repeating: -1, count: 100001)
    fibo[0] = 0
    fibo[1] = 1
    
    for num in 2...n {
        fibo[num] = (fibo[num-1] + fibo[num-2]) % 1234567
    }
    
    return fibo[n]
}
