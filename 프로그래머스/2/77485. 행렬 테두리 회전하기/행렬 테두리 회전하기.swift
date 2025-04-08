import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    // 결과 값
    var result: [Int] = []
    
    // 초기 맵 세팅
    var maps: [[Int]] = [[Int]](
        repeating: [Int](
            repeating: -1, 
            count: columns
        ),
        count: rows
    )
    
    var num = 1
    for y in 0..<maps.count {
        for x in 0..<maps[0].count {
            maps[y][x] = num
            num += 1
        }
    }
    
    // 쿼리에 따라 맵회전
    for query in queries {
        let value = rotateMap(map: maps, query: query)
        maps = value.map
        result.append(value.minValue)
    }
    
    return result
}

func rotateMap(map: [[Int]], query: [Int]) -> (map: [[Int]], minValue: Int) {
    var result = map
    var minValue: Int = Int.max
    
    let x1 = query[1] - 1
    let y1 = query[0] - 1
    let x2 = query[3] - 1
    let y2 = query[2] - 1
    
    // "좌상단 -> 우상단"
    for x in (x1+1)...x2 {
        result[y1][x] = map[y1][x-1]
        minValue = min(minValue, result[y1][x])
    }
    
    // "우상단 -> 우하단"
    for y in (y1+1)...y2 {
        result[y][x2] = map[y-1][x2]
        minValue = min(minValue, result[y][x2])
    }
    
    // "우하단 -> 좌하단"
    for x in (x1..<x2).reversed() {
        result[y2][x] = map[y2][x+1]
        minValue = min(minValue, result[y2][x])
    }

    // "좌하단 -> 좌상단"
    for y in (y1..<y2).reversed() {
        result[y][x1] = map[y+1][x1]
        minValue = min(minValue, result[y][x1])
    }

    return (map: result, minValue: minValue)
}