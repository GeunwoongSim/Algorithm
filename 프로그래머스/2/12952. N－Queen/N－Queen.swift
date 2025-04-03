import Foundation

func solution(_ n:Int) -> Int {
    let map = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    let result = findQueenLocation(0, map)
    return result
}

// y값을 입력 받으면 현재 상태에 대한 queen을 세울 수 있은 위치의 개수를 반환
func findQueenLocation(_ idx: Int, _ map: [[Bool]]) -> Int {
    if idx == map.count { 
        return 1
    }
    var map = map
    var result: Int = 0
    
    // 퀸이 배치 가능한지 확인
    for i in 0..<map.count {
        var check: Bool = true
        // map[idx][i]에 퀸을 배치할 수 있는가
        if idx >= 1 {
            for j in 1...idx {
                // 직선상에 다른 퀸이 있는가
                if map[idx-j][i] {
                    check = false
                    break
                }
                // 왼쪽 대각선에 다른 퀸이 있는가
                if idx-j >= 0 && i-j >= 0 {
                    if map[idx-j][i-j] {
                        check = false
                        break
                    }
                }
                // 오른쪽 대각선에 다른 퀸이 있는가
                if idx-j >= 0 && i+j < map.count {
                    if map[idx-j][i+j] {
                        check = false
                        break
                    }
                }
            }
        }
        // 겹치는 퀸의 배치가 있으면 패스
        if !check { continue }
        // 겹치는 퀸의 배치가 없으면 배치하고 다음칸으로 전진
        map[idx][i] = true
        result += findQueenLocation(idx+1, map)
        //기존 상태로 복구
        map[idx][i] = false
    }
    return result
}