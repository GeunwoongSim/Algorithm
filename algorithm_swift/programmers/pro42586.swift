import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var times: [Int] = zip(progresses, speeds).map{
        if (100-$0.0) % $0.1 == 0 { return (100-$0.0) / $0.1 }
        return (100-$0.0) / $0.1 + 1
    }
    
    for idx in 1..<times.count {
        if times[idx] < times[idx-1] {
            times[idx] = times[idx-1]
        }
    }
    
    var day: Int = times[0]
    var total: Int = 0
    for time in times {
        if day == time {
            total += 1
        } else{
            result.append(total)
            total = 1
            day = time
        }
    }
    result.append(total)
    return result
}
