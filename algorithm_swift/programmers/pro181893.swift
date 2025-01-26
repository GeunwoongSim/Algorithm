import Foundation

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    //조건에 따라 범위를 늘리고 줄임
    var result: (Int, Int) = (0,arr.count)
    for q in query.enumerated() {
        if q.offset%2 == 0 {
            result.1 = result.0 + q.element
        }else{
            result.0 = result.0 + q.element
        }
    }
    return [Int](arr[result.0...result.1])
    
    
    
    //실제 배열에서 조건에 따라 값을 삭제
    var result: [Int] = arr
    for q in query.enumerated() {
        if q.offset%2 == 0 { //removeLast
            for _ in 0..<(result.count-(q.element+1)) {
                result.removeLast()
            }
        }
        else{
            for _ in 0..<q.element {
                result.removeFirst()
            }
        }
    }

    return result
}

/*
 정수 배열 arr와 query가 주어집니다.

 query를 순회하면서 다음 작업을 반복합니다.

 짝수 인덱스에서는 arr에서 query[i]번 인덱스를 제외하고 배열의 query[i]번 인덱스 뒷부분을 잘라서 버립니다.
 홀수 인덱스에서는 arr에서 query[i]번 인덱스는 제외하고 배열의 query[i]번 인덱스 앞부분을 잘라서 버립니다.
 위 작업을 마친 후 남은 arr의 부분 배열을 return 하는 solution 함수를 완성해 주세요.
 
 
 [0, 1, 2, 3, 4, 5]    [4, 1, 2]   =>  [1, 2, 3]
 */
