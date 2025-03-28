import Foundation

// 시간대의 유저수, 한서버의 유저수, 서버의 유지시간
func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var result1: Int = 0 // 서버 증설 횟수
    var servers: [(Int, Int)] = [] // (서버가 종료되는 시간, 서버 개수)
    
    for H in 0..<24 {
        // 이용시간이 종료된 서버가 있는지 확인
        
        for (idx, server) in servers.enumerated() {
            if server.0 == H { // 이번에 종료됨
                servers.removeFirst() // 종료는 앞에서 부터 종료됨
            }
        }
        
        // 최대 이용가능한 유저 수 (기본 한개 + 추가 서버)
        var maxUsers: Int = m
        for server in servers {
            maxUsers += server.1 * m
        }
        
        // 서버 증설이 필요
        if players[H] >= maxUsers {
            // maxUsers 미만까지 입장가능 : 남은 유저수 = 전체 - (max-1)
            let leftUsers: Int = players[H] - (maxUsers-1)
            
            
            // 서버 증설
            if leftUsers % m == 0 { 
                result1 += leftUsers / m 
                servers.append((H+k, leftUsers/m))
            } else {
                result1 += leftUsers / m + 1
                servers.append((H+k, leftUsers/m+1))
            }
        }
    }
    return result1
}