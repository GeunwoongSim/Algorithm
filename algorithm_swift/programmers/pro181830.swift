import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    var result: [[Int]] = arr
    let y = arr.count
    let x = arr[0].count
    if y > x {
        for idx in 0..<result.count {
            result[idx].append(contentsOf: repeatElement(0, count: y-x))
        }
    }
    else {
        for _ in 0..<(x-y) {
            result.append([Int](repeating: 0, count: x))
        }
    }
    return result
}

/*
 이차원 정수 배열 arr이 매개변수로 주어집니다. arr의 행의 수가 더 많다면 열의 수가 행의 수와 같아지도록 각 행의 끝에 0을 추가하고, 열의 수가 더 많다면 행의 수가 열의 수와 같아지도록 각 열의 끝에 0을 추가한 이차원 배열을 return 하는 solution 함수를 작성해 주세요.

 [[572, 22, 37], [287, 726, 384], [85, 137, 292], [487, 13, 876]]
 [[572, 22, 37, 0], [287, 726, 384, 0], [85, 137, 292, 0], [487, 13, 876, 0]]
 */
