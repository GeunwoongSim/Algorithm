import Foundation

func solution(_ board:[[Int]]) -> Int {
    let widthMax: Int = board.count
    let value: [(Int,Int)] = [
        (-1,-1),(-1,0),(-1,1), (0,-1),(0,0),(0,1), (1,-1),(1,0),(1,1)
    ]
    
    var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: widthMax), count: widthMax)
    
    for y in 0..<board.count {
        for x in 0..<board[y].count {
            if board[y][x] == 1 {
                for val in value {
                    if (y+val.1 < widthMax) && (y+val.1 >= 0) && (x+val.0 < widthMax) && (x+val.0 >= 0){
                        map[y+val.1][x+val.0] = 1
                    }
                }
            }
        }
    }
    for y in 0..<board.count {
        for x in 0..<board[y].count {
            print(board[y][x],terminator: "")
        }
        print()
    }
    print("===========================")
    for y in 0..<board.count {
        for x in 0..<board[y].count {
            print(map[y][x],terminator: "")
        }
        print()
    }
    return map.flatMap{$0}.count - map.flatMap{$0}.filter{$0==1}.count
    
    return 0
}

/*
 다음 그림과 같이 지뢰가 있는 지역과 지뢰에 인접한 위, 아래, 좌, 우 대각선 칸을 모두 위험지역으로 분류합니다.
 OOOOO
 OXXXO
 OX*XO
 OXXXO
 OOOOO
 
 
 지뢰는 2차원 배열 board에 1로 표시되어 있고 board에는 지뢰가 매설 된 지역 1과, 지뢰가 없는 지역 0만 존재합니다.
 지뢰가 매설된 지역의 지도 board가 매개변수로 주어질 때, 안전한 지역의 칸 수를 return하도록 solution 함수를 완성해주세요.
 
 [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]]    16
 */
