import Foundation

func solution(_ board: [[Int]]) -> Int {
    var answer: Int = 0
    
    var checkBoard: [[Int]] = [[Int]](
        repeating: [Int](
            repeating: 0,
            count: board[0].count
        ),
        count: board.count
    )
    
    // 초기값 생성
    for i in 0..<board.count {
        checkBoard[i][0] = board[i][0]
        answer = max(answer,checkBoard[i][0])
    }
    for i in 0..<board[0].count {
        checkBoard[0][i] = board[0][i]
        answer = max(answer,checkBoard[0][i])
    }
    
    for y in 1..<board.count {
        for x in 1..<board[0].count {
            if board[y][x] == 1 {
                let a = checkBoard[y-1][x-1]
                let b = checkBoard[y-1][x]
                let c = checkBoard[y][x-1]
                checkBoard[y][x] = min(min(a,b),c) + 1   
                answer = max(answer,checkBoard[y][x])
            }
        }
    }
    return answer*answer
}