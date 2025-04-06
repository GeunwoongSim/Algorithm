import Foundation

func solution(_ maps:[String]) -> [Int] {
    
    let maps: [[String]] = maps.map { Array($0).map { String($0) } } // N * M 크기
    let N: Int = maps.count // 지도의 세로길이
    let M: Int = maps[0].count // 지도의 가로길이
    
    var result: [Int] = [] // 생존일수가 담긴 배열(오름차순으로 정렬)
    
    // 확인했는지 확인하기 위한 2차원 배열
    var check: [[Bool]] = [[Bool]](
        repeating: [Bool](
            repeating: false , 
            count: M
        ), 
        count: N
    )
    
    // 상하좌우 이동 값을 가진 배열
    let move: [(x: Int, y: Int)] = [
        (x: 0, y: -1), // 상
        (x: 0, y: 1), // 하
        (x: -1, y: 0), // 좌
        (x: 1, y: 0) // 우
    ]
    
    // 맵의 요소를 확인
    for y in 0..<N {
        for x in 0..<M {
            
            // 이전에 확인했으면 패스
            if check[y][x] { continue }
            
            // 이전에 확인안한 경우
            check[y][x] = true
            
            // 섬인 경우
            if maps[y][x] != "X" { 
                // 연결된 섬의 정보
                var queue: [(x: Int, y: Int)] = [(x: x, y: y)]
                var idx: Int = 0
                var liveDay: Int = 0
                
                // 연결된 섬이 있는지 확인
                while idx < queue.count {
                    
                    let now = queue[idx]
                    liveDay += Int(maps[now.y][now.x]) ?? 0
                    
                    for pos in move {
                        // 이동할 위치
                        let mPos = (x: now.x+pos.x, y: now.y+pos.y)
                        
                        // 맵 범위를 벗어나면 패스
                        if mPos.x < 0 || mPos.x >= M || mPos.y < 0 || mPos.y >= N { continue }
                        
                        // 확인한 위치가 아니면서 섬인 경우
                        if !check[mPos.y][mPos.x] && maps[mPos.y][mPos.x] != "X" {
                            queue.append((x: mPos.x, y: mPos.y)) // 위치를 저장
                            check[mPos.y][mPos.x] = true // 중복으로 저장하지 않게 확인했다고 표시
                        }
                    }
                    
                    idx += 1
                }
                
                // 연결된 섬을 전부 확인했으므로 생존기간을 저장
                result.append(liveDay)
            }
        }
    }

    return result.isEmpty ? [-1] : result.sorted()
}