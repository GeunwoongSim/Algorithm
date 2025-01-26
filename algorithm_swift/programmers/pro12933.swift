func solution(_ n:Int64) -> Int64 {
    let arr = String(n).map{String($0)}.sorted(by: >).joined()
    return Int64(arr)!
}
