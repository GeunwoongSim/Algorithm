import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let map : [[String]] = park.map{$0.map{String($0)}}
    
    let dic: [String:(Int,Int)] = ["N":(-1,0) ,"S":(1,0) ,"W":(0,-1), "E": (0,1)] // 방향에 따른 이동 값
    var pos: (Int,Int) = (0,0)
    
    for y in 0..<park.count {
        for x in 0..<park[0].count {
            if map[y][x] == "S" {
                pos = (y,x)
            }
        }
    }
    for route in routes {
        let route = route.components(separatedBy: " ")
        pos = move(current: pos, dir: dic[route[0]]!, many: Int(route[1])!, map: map)
    }

    return [pos.0, pos.1]
}
func move(current: (Int,Int), dir: (Int,Int), many: Int, map: [[String]]) -> (Int,Int) {
    var pos: (Int,Int) = current
    
    var toggle: Bool = true
    for _ in 0..<many {
        pos = (pos.0+dir.0,pos.1+dir.1)
        if pos.0 < 0 || pos.0 >= map.count || pos.1 < 0 || pos.1 >= map[0].count {
            toggle = false
            break
        }
        if map[pos.0][pos.1] == "X" {
            toggle = false
            break
        }
    }
    
    if !toggle { pos = current }
    return pos
}
