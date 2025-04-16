import Foundation

func solution(_ n:Int) -> [[Int]] {
    var path: [[Int]] = []
    
    func hanoi(_ n: Int, _ start: Int, _ end: Int, _ sub: Int) {
    if n == 1 { 
        path.append([start, end])
        return 
    }
    hanoi(n-1, start, sub, end)
    path.append([start, end])
    hanoi(n-1, sub, end, start)
}
    
    hanoi(n, 1, 3, 2)
    return path
}

