import Foundation

func solution(_ book_time:[[String]]) -> Int {
    
    var result: Int = 0 // 가장 방을 많이 쓸때의 방개수
    var room: Int = 0 // 사용 중인 방 개수
    
    var startTime: [(Int, Int)] = [] // 대실 시작시간 (시, 분)
    var endTime: [(Int, Int)] = [] // 대실 종료시간 (시, 분) - 청소시간 포함 
    
    // 대실 시작시간과 종료시간(+청소시간)으로 분리
    for time in book_time {
        let start = time[0].split(separator: ":").map{ String($0) }
        let startH: Int = Int(start[0])!
        let startM: Int = Int(start[1])!
        startTime.append((startH, startM)) // 시작시간 추가
        
        let end = time[1].split(separator: ":").map{ String($0) }
        let endH: Int = Int(end[0])! + (Int(end[1])! + 10) / 60
        let endM: Int = (Int(end[1])! + 10) % 60
        endTime.append((endH, endM))
    }
    
    // startTime과 endTime은 정렬 필요
    startTime = startTime.sorted(by: {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        return $0.0 < $1.0
    })
    
    endTime = endTime.sorted(by: {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        return $0.0 < $1.0
    })
    
    // 시작시간이 비어있지 않으면 종료시간도 비어있지 않음 -> 시작 시간만 확인
    while !startTime.isEmpty {
        if let start = startTime.first, let end = endTime.first {
            let time: (Int, Int) = nowTimeCheck(start, end)
            
            if time == start {
                room += 1
                startTime.removeFirst()
            }
            
            
            if time == end {
                room -= 1
                endTime.removeFirst()
            }
    
            result = max(result, room)
        }
    }
    // 종료시간을 확인해도 최대 방개수는 줄어들기만 하니 따로 확인필요X
    
    return result
}

// 대실 시작시간과 종료시간중에 더 작은 시간을 반환
func nowTimeCheck(_ start: (Int, Int), _ end: (Int, Int)) -> (Int, Int) {
    
    // H로 비교
    if start.0 < end.0 { return start }
    if start.0 > end.0 { return end }
    
    // M으로 비교
    if start.1 < end.1 { return start }
    if start.1 > end.1 { return end }
    
    return start
}
