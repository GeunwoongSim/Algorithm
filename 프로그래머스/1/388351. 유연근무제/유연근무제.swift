import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var result: Int = 0
    var logs: [[Int]] = []
    
   
    for i in 0..<timelogs.count {
        var idx = (8 - startday) % 7
        var temp: [Int] = []
        
        for _ in 0..<5 {
            temp.append(timelogs[i][idx])
            idx += 1
            if idx == 7 { idx = 0 }
        }
        
        logs.append(temp)
    }
    
    for idx in 0..<schedules.count {
        result += check(hope: schedules[idx], reals: logs[idx])
    }
    
    return result
}

func check(hope: Int, reals: [Int]) -> Int {
    let total = (hope / 100 * 60) + (hope % 100) + 10 // 분으로 통일
    
    for real in reals {
        let compReal = (real / 100 * 60) + (real % 100)
        // 출근한 시간이 희망한 시간보다 늦으면
        if total < compReal {
            return 0
        }
    }
    return 1
}