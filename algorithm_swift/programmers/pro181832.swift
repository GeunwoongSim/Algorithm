import Foundation



func solution(_ n:Int) -> [[Int]] {
    var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    let move: [(Int,Int)] = [(0,1),(1,0),(0,-1),(-1,0)] //(y,x)
    
    var idx: Int = 0
    var number: Int = 1
    var nowP: (Int,Int) = (0,-1) //(y,x)
    while number <= n*n {
        let pre: (Int,Int) = nowP
        nowP = (nowP.0+move[idx].0 ,nowP.1+move[idx].1)
        
        if nowP.0 >= 0 && nowP.0 < n && nowP.1 >= 0 && nowP.1 < n && (map[nowP.0][nowP.1] == 0) {
            map[nowP.0][nowP.1] = number
            number += 1
        }else {
            idx = (idx+1)%4
            nowP = pre
        }
    }
    return map
}

/*
 양의 정수 n이 매개변수로 주어집니다. n × n 배열에 1부터 n2 까지 정수를 인덱스 [0][0]부터 시계방향 나선형으로 배치한 이차원 배열을 return 하는 solution 함수를 작성해 주세요.
 
 4   =>  [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]]
 */
