import Foundation

func solution(_ dirs:String) -> Int {
    var cur: (Int, Int) = (0, 0) // (x,y)
    let moves: [String:(Int, Int)] = ["U":(0, 1), "D":(0, -1), "L":(-1, 0), "R":(1, 0)] // 이동값
    let dirs: [String] = dirs.map{ String($0) } // 이동할 경로
    var roots: [((Int,Int), (Int,Int))] = [] //이동한 경로
    // (x1,y1) -> (x2,y2) 또는 (x2,y2) -> (x1,y1)
    
    for dir in dirs {
        let move: (Int, Int) = moves[dir]!
        let start: (Int, Int) = cur // 출발 위치
        let end: (Int, Int) = (cur.0+move.0, cur.1+move.1) // 도착 위치
        //이동 가능한 경우
        if (end.0 >= -5 && end.0 <= 5) && (end.1 >= -5 && end.1 <= 5) {
            if !check(roots, start, end) { //이동한적 없는 경로면 경로 저장
                roots.append((start,end))
                roots.append((end,start))
            }
            cur = end
        }
    }
    return roots.count / 2
}
func check(_ roots: [((Int,Int), (Int,Int))], _ start: (Int, Int), _ end: (Int, Int)) -> Bool {
    //start : 출발지, end : 도착지
    let dir: ((Int, Int), (Int, Int)) = (start, end)
    for root in roots {
        if dir.0.0 == root.0.0 && dir.0.1 == root.0.1 && dir.1.0 == root.1.0 && dir.1.1 == root.1.1 {
            return true
        }
    }
    return false
}
