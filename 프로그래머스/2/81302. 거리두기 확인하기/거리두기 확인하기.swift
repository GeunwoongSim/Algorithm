import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    for place in places {
        result.append(isComplete(input: place))
    }
    return result
}

func isComplete(input: [String]) -> Int {
    let map = input.map { Array($0).map { String($0) } }
    var checkMap: [[Bool]] = [[Bool]](repeating: [Bool](repeating: true, count: 5), count: 5)
    var queue: [(x: Int, y: Int, len: Int)] = []
    let movePoint: [[Int]] = [[-1, 0], [1, 0], [0, -1], [0, 1]] // 좌우상하
    
    for y in 0..<5 {
        for x in 0..<5 {
            // 현재 위치에 사람이 있으면 확인
            if map[y][x] == "P" {
                
                // queue 초기화 
                queue = []
                queue.append((x: x, y: y, len: 0))
                var idx: Int = 0
                
                while idx < queue.count {
                    let p0 = queue[idx]
                    checkMap[p0.y][p0.x] = false
                    
                    for mp in movePoint {
                        // 확인할 위치
                        let p1 = (
                            x: p0.x + mp[0],
                            y: p0.y + mp[1],
                            len: p0.len + 1
                        )
                        
                        // 거리 3미만일 때만 확인하면 됨
                        if p1.x >= 0 && p1.x < 5 && p1.y >= 0 && p1.y < 5 &&  p1.len < 3 {
                            // 이전에 확인안했음
                            if checkMap[p1.y][p1.x] {
                                // 확인할 위치에 사람이 있음 - 거리안지킴 
                                if map[p1.y][p1.x] == "P" {
                                    return 0
                                }
                                // 확인할 위치가 빈자림임 - 큐에 등록
                                if map[p1.y][p1.x] == "O" {
                                    queue.append(p1)
                                }
                            }
                        }
                    }
                    
                    idx += 1
                }
            }
        }
    }
    return 1
}