import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    // 입력된 값 정리
    var numberOfpriority: [Int:Int] = [:] // 우선순위에 따른 개수
    for priority in priorities {
        if let num = numberOfpriority[priority] {
            numberOfpriority[priority] = num+1
        }else {
            numberOfpriority[priority] = 1
        }
    }
    
    // 결과를 구하기 위한 준비
    var inputArr: [(Int,Int)] = priorities.enumerated().map{ return ($0.element,$0.offset)} // (우선순위, 시작위치)
    var result: Int = 0 // 실행된 프로세스 개수
    var prioritySortKey: [Int] = Array(numberOfpriority.keys).sorted(by:>) // 우선순위를 내림차순 정렬
    
    // 결과를 구하기
    while !inputArr.isEmpty { // 전체 프로세스가 끝날때 까지 반복
        let check: (Int,Int) = inputArr.removeFirst()
        let element: Int = check.0
        let offset: Int = check.1
        
        if element == prioritySortKey.first{
            result += 1
            if offset == location {
                return result
            }
            numberOfpriority[element]! -= 1 // 해당 우선순위 개수 -1
            if numberOfpriority[element] == 0 { // 우선순위의 프로세스가 0개가 되면 해당 우선순위를 삭제
                numberOfpriority[element] = nil
                prioritySortKey.removeFirst()
            }
        }else {
            inputArr.append(check)
        }
    }
    return -1
}
