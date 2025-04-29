import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    let diffs: [Int64] = diffs.map { Int64($0) }
    let times: [Int64] = times.map { Int64($0) }
    
    var low: Int64 = 1
    var high: Int64 = -1
    var mid: Int64 = -1
    
    for diff in diffs { high = max(high, diff) }
  
    while low <= high {
        mid = (low + high) / 2
        let result = checkLevel(diffs, times, mid)
        if result <= limit {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return Int(low)
}

func checkLevel(_ diffs:[Int64], _ times:[Int64], _ level: Int64) -> Int64 {
    var result: Int64 = 0
    var time_prev: Int64 = 0 
    
    for (diff, time) in zip(diffs, times) {
        if diff <= level {
            result += time
        } else {
            result += (diff - level) * (time + time_prev) + time
        }
        time_prev = time
    }
    return result
}