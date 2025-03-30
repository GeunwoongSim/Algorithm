import Foundation


func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    let MAXLEN = 10001
    var roads: [[Int]] = [[Int]](repeating: [Int](repeating: MAXLEN, count: N), count: N) // 도로 정보
    var roadQueue: [(Int, Int)] = [(0, 0)] // (마을번호, 해당 마을까지의 시간)
    var idx: Int = 0 // roadQueue에 접글할 인덱스
    var result: [Int] = [Int](repeating: 500001, count: N) // 1번 마을에서 각 마을까지의 최단 시간 - k의 최대값이 500000이라 500001으로 설정
    
     var answer = 0
    
    // 도로 연결 상황을 정리 - 도로가 여러개면 최소값만 기억
    for info in road {
        let a = info[0] - 1
        let b = info[1] - 1
        let len = info[2]
        
        roads[a][b] = min(len, roads[a][b])
        roads[b][a] = min(len, roads[b][a])
    }
    
    while idx < roadQueue.count {
        let villageNum: Int = roadQueue[idx].0 // 도착한 마을 번호
        let nowTime: Int = roadQueue[idx].1 // 도착할때까지 걸린 시간
        
        for i in 1..<N {
            // MAXLEN이 아니면 도로가 연결된 상태
            if roads[villageNum][i] != MAXLEN {
                // 새롭게 찾은 경로가 기존보다 시간이 짧음
                if result[i] > roads[villageNum][i] + nowTime {
                    result[i] = roads[villageNum][i] + nowTime
                    roadQueue.append((i, roads[villageNum][i] + nowTime))
                }
            }
        }
        idx += 1
    }
   
    for value in result {
        if value <= k {
            answer += 1
        }
    }

    return answer + 1
}