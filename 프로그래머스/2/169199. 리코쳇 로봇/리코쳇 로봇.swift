import Foundation

func solution(_ board:[String]) -> Int {
    let board: [[String]] = board.map { Array($0).map { String($0) } }
    let N: Int = board.count 
    let M: Int = board[0].count
    
    var R: (x: Int, y: Int) = (x: -1, y: -1) // 시작점
    var G: (x: Int, y: Int) = (x: -1, y: -1) // 도착점
    
    // 이동정보
    let movePos: [(x: Int, y: Int)] = [
        (x:0, y: -1), // 상
        (x:0, y: 1), // 하
        (x:-1, y: 0), // 좌
        (x:1, y: 0), // 우
    ]
    
    // ((현재위치- x,y), 이동횟수)
    var queue: [((x:Int, y: Int), Int)] = []
    var qIdx: Int = 0 
    
    // 특정 좌표에 도착한적이 있는지 확인 - 도착한적 있으면 도착할때 까지의 거리
    var checkBoard: [[Int]] = [[Int]](
        repeating: [Int](
            repeating: -1,
            count: M
        ),
        count: N
    )
    
    // 시작점, 도착점 찾기
    for y in 0..<N {
        for x in 0..<M {
            if board[y][x] == "R" { R = (x: x, y: y) }
            if board[y][x] == "G" { G = (x: x, y: y) }
        }
    }
    
    // 시작점 삽입
    queue.append((R, 0))
    
    while qIdx < queue.count {
        
        var now: (x: Int, y: Int) = queue[qIdx].0
        var len: Int = queue[qIdx].1
        
        for move in movePos {
            var pos = now
            
            while true {
                let tempPos =  (x: pos.x + move.x, y: pos.y + move.y)
                
                // 이동할 위치가 보드 내부이면서 장애물이 아니면 이동
                if tempPos.x >= 0 && tempPos.x < M &&
                    tempPos.y >= 0 && tempPos.y < N &&
                    board[tempPos.y][tempPos.x] != "D" 
                {
                    pos = tempPos
                } else { // 이동할 위치가 보드 밖이거나 장애물인 경우
                    // 이전에 방문하지 않았거나, 방문했으나 이번에 더 빠르게 도착한 경우 갱신
                    let check = checkBoard[pos.y][pos.x]
                    
                    if check == -1 || (check != -1 && check > len+1) {
                        queue.append((pos, len+1))
                        checkBoard[pos.y][pos.x] = len+1
                    }
                    break
                }
            }
        }
        qIdx += 1
    }
    return checkBoard[G.y][G.x]
}