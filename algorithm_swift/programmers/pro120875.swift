import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    func cal(point1: (Double,Double), point2: (Double,Double)) -> Double{ //기울기 계산
        return (point2.1 - point1.1) / (point2.0 - point1.0)
    }
    
    let points: [(Int,Int,Int,Int)] = [(0,1,2,3),(0,2,1,3),(0,3,1,2)]
    let dot: [(Double,Double)] = dots.map{ (Double($0[0]),Double($0[1])) }
    for point in points {
        if cal(point1: dot[point.0], point2: dot[point.1]) == cal(point1: dot[point.2], point2: dot[point.3]) {
            return 1
        }
    }
    return 0
}

/*
 점 네 개의 좌표를 담은 이차원 배열  dots가 다음과 같이 매개변수로 주어집니다.

 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]
 주어진 네 개의 점을 두 개씩 이었을 때, 두 직선이 평행이 되는 경우가 있으면 1을 없으면 0을 return 하도록 solution 함수를 완성해보세요.
 
 [[1, 4], [9, 2], [3, 8], [11, 6]]  =>  1
 [[3, 5], [4, 1], [2, 4], [5, 10]]  =>  0
 
 */
