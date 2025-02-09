import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = [Int](repeating: -1, count: numbers.count)
    var stack: [(Int, Int)] = [] // $0: arrs의 Index, $1: arrs의 number
    var idx = numbers.count - 1 // 뒷쪽부터 접근
    while idx >= 0 {
        let num = numbers[idx] // 현재 값
        while !stack.isEmpty && num >= stack.last!.1 { // 현재 값보다 작은 것은 전부 삭제
            let last = stack.removeLast()
            result[last.0] = (stack.last ?? (-1, -1)).1
        }
        stack.append((idx, num))
        idx -= 1
    }
    while !stack.isEmpty { // stack에 남은 것들 정리
        let last = stack.removeLast()
        result[last.0] = (stack.last ?? (-1, -1)).1
    }
    return result
}

// 시간 초과가 난 소스 -> 스택 이용하는 키워드를 확인
/*
 func solution(_ numbers:[Int]) -> [Int] {
     // 필수한 프로퍼티 선언
     let maxIdx: Int = numbers.count - 1 // 접근용 인덱스 - 최대 인덱스
     var resultArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 3), count: maxIdx + 1) // [0]: 가장큰수, [1]: 큰수의인덱스, [2]: 결과
     
     // 초기값 등록
     resultArr[maxIdx][0] = numbers[maxIdx]
     resultArr[maxIdx][1] = maxIdx
     resultArr[maxIdx][2] = -1
     
     var idx = maxIdx - 1
     while idx >= 0 {
         let number = numbers[idx]
         if number >= resultArr[idx+1][0] {
             resultArr[idx][0] = number // 가장 큰수 등록
             resultArr[idx][1] = idx // 큰수의 인덱스 등록
             resultArr[idx][2] = -1 // number보다 큰 수가 없었으니 -1
         }else { // 현재까지 가장 큰 수 보다 number가 작음 - 결과값을 찾아야함
             resultArr[idx][0] = resultArr[idx+1][0] // 가장 큰수 등록
             resultArr[idx][1] = resultArr[idx+1][1] // 큰수의 인덱스 등록
             resultArr[idx][2] = -1 // 우선 -1 넣고 변경
             //자기보다 처음 큰 수를 찾아야함 ( 가장 큰수의 인덱스 뒤로는 확인할 필요없음 )
             for i in idx...resultArr[idx][1] {
                 if number < numbers[i] { // number보다 큰 수를 찾음
                     resultArr[idx][2] = numbers[i]
                     break
                 }
             }
         }
         idx -= 1
     }
     return resultArr.map{ $0[2] }
 }
 */
