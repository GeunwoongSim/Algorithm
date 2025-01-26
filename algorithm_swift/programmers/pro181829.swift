import Foundation

func solution(_ board:[[Int]], _ k:Int) -> Int {
    var result: Int = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count{
            if i + j <= k {
                result += board[i][j]
            }
        }
    }
    return result
}
/*
 2차원 정수 배열 board와 정수 k가 주어집니다.

 i + j <= k를 만족하는 모든 (i, j)에 대한 board[i][j]의 합을 return 하는 solution 함수를 완성해 주세요.
 */
