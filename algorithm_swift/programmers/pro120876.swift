import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var up: [Int] = []
    var down: [Int] = []
    for line in lines {
        up.append(line[0])
        down.append(line[1])
    }
    up.sort(by: <)
    down.sort(by: <)
    var value: Int = 0
    var result: Int = 0
    for point in up[0]...down[lines.count-1]{
        while up.first == point {
            up.removeFirst()
            value += 1
        }
        while down.first == point {
            down.removeFirst()
            value -= 1
        }
        if value >= 2 {
            result += 1
        }
    }
    
    return result
}

/*
 선분 3개가 평행하게 놓여 있습니다. 세 선분의 시작과 끝 좌표가 [[start, end], [start, end], [start, end]] 형태로 들어있는 2차원 배열 lines가 매개변수로 주어질 때, 두 개 이상의 선분이 겹치는 부분의 길이를 return 하도록 solution 함수를 완성해보세요.

 lines가 [[0, 2], [-3, -1], [-2, 1]]일 때 그림으로 나타내면 다음과 같습니다.

 선분이 두 개 이상 겹친 곳은 [-2, -1], [0, 1]로 길이 2만큼 겹쳐있습니다.
 
 [[0, 1], [2, 5], [3, 9]]  =>  2
 */
