import Foundation

func solution(_ M:Int, _ N:Int) -> Int {
    return M * N - 1
    
    
    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: M+1)
    
    for Mnum in 1...M {
        for Nnum in 1...N {
            if Mnum == 1 && Nnum == 1 { continue }
            var minV: Int = Int.max
            for n in 1..<Nnum {
                minV = min(minV,result[Mnum][n]+result[Mnum][Nnum-n]+1)
            }
            for m in 1..<Mnum {
                minV = min(minV,result[m][Nnum]+result[Mnum-m][Nnum]+1)
            }
            result[Mnum][Nnum] = minV
        }
    }
    return result[M][N]
}

/*
 머쓱이는 큰 종이를 1 x 1 크기로 자르려고 합니다. 예를 들어 2 x 2 크기의 종이를 1 x 1 크기로 자르려면 최소 가위질 세 번이 필요합니다.

 정수 M, N이 매개변수로 주어질 때, M x N 크기의 종이를 최소로 가위질 해야하는 횟수를 return 하도록 solution 함수를 완성해보세요.
 
 2    2  => 3
 */
