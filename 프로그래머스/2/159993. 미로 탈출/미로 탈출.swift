import Foundation

func solution(_ maps:[String]) -> Int {
    // 입력된 미로 지도
    let maps = maps.map { Array($0).map{ String($0) }} 
    
    // 좌표 정보 (x, y)
    var startPoint: (x: Int, y: Int) = (-1, -1)
    var leverPoint: (x: Int, y: Int) = (-1, -1)
    var endPoint: (x: Int, y: Int) = (-1, -1)
    
    // 미로 지도 정리
    for y in 0..<maps.count {
        for x in 0..<maps[y].count {
            // 시작 지점
            if maps[y][x] == "S" {
                startPoint = (x, y)
            }
            // 레버 지점
            if maps[y][x] == "L" {
                leverPoint = (x, y)
            }
            // 도착 지점
            if maps[y][x] == "E" {
                endPoint = (x, y)
            }
        }
    }
    
    // 레버지점까지의 시간
    let startToLever = calCulateAToB(startPoint, leverPoint, maps)
    if startToLever == -1 { return -1 }
    
    // 도착지점까지의 시간
    let leverToEnd = calCulateAToB(leverPoint, endPoint, maps)
    if leverToEnd == -1 { return -1 }
    
    return startToLever + leverToEnd
}

// A -> B 까지의 이동 시간
func calCulateAToB(
    _ startPoint: (x: Int, y: Int),
    _ endPoint: (x: Int, y: Int),
    _ maps: [[String]]
) -> Int {
    // 최대값 
    let MAXNUM: Int = Int.max
    // 이동 시간
    var result: Int = MAXNUM // 최대 100*100 이라 10001로 지정
    // 이동 경로에 따른 정보 ((좌표 정보), 이동시간)
    var pathStack: [((x: Int, y: Int), Int)] = []
    // 이동정보
    let moving: [(x: Int, y: Int)] = [(0, -1), (1, 0), (0, 1), (-1, 0)] 
    // 이전에 해당 칸에 이동했었는지 확인
    var pointCheck: [[Int]] = [[Int]](
        repeating: [Int](
            repeating: -1,
            count: maps[0].count
        ), 
        count: maps.count
    )
    
    // Start -> End 까지의 시간 구하기
    pathStack.append((startPoint, 0))
    
    while !pathStack.isEmpty {
        // 한칸 이동
        guard let path = pathStack.popLast() else { break }
        let point = path.0
        let len = path.1
        // 갔던 곳이라고 표시
        if pointCheck[point.y][point.x] == -1 || pointCheck[point.y][point.x] > len {
            pointCheck[point.y][point.x] = len    
        }
        
        
        // 현재 칸이 endPoint 경우
        if point == endPoint {
            result = min(result, len)
        }
        else if len > result { // endPoint 아니면서 현재까지 이동 시간이 최소 시간보다 큰 경우
            continue
        }
        
        // 현재 칸에서 이동 할 수 있는 칸을 스택에 저장
        // - 미로를 벗어나지 않음
        // - 연결된 길 이어야 함
        // - 이전에 간 길이 아니어야 함
        
        for movingPoint in moving {
            let moveX = point.x + movingPoint.x
            let moveY = point.y + movingPoint.y
            
            // 미로를 벗어나지 않음
            if moveX >= 0 && moveX < maps[0].count && moveY >= 0 && moveY < maps.count {
                // 이전에 간 길이 아니고 길이 연결되어 있음
                if maps[moveY][moveX] != "X" 
                && (pointCheck[moveY][moveX] == -1 || pointCheck[moveY][moveX] > len+1) {
                    pathStack.append(((x: moveX, y: moveY), len+1))
                }
            }
        }
    }
    
    // MAXNUM이면 A->B가 연결되어 있지 않음
    return result == MAXNUM ? -1 : result
}