import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
//    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for num in 0..<n {
        result[num][num] = 1
    }
    return result
}

/*
 정수 n이 매개변수로 주어질 때, 다음과 같은 n × n 크기의 이차원 배열 arr를 return 하는 solution 함수를 작성해 주세요.

 arr[i][j] (0 ≤ i, j < n)의 값은 i = j라면 1, 아니라면 0입니다.
 */