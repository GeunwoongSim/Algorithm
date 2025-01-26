import Foundation

func solution(_ arr:[Int], _ n:Int) -> [Int] {
    var toggle: Bool = false
    var result: [Int] = arr
    if arr.count%2 == 0 {
        toggle = true
    }else {
        toggle = false
    }
    
    for index in 0..<arr.count {
        if toggle{ //길이가 짝수면 홀수 인덱스에 n을 더함
            if index%2 != 0 {
                result[index] += n
            }
        }else{ //길이가 홀수면 짝수 인덱스에 n을 더함
            if index%2 == 0 {
                result[index] += n
            }
        }
    }
    return result
}

/*
 정수 배열 arr과 정수 n이 매개변수로 주어집니다. arr의 길이가 홀수라면 arr의 모든 짝수 인덱스 위치에 n을 더한 배열을, arr의 길이가 짝수라면 arr의 모든 홀수 인덱스 위치에 n을 더한 배열을 return 하는 solution 함수를 작성해 주세요.
 */
