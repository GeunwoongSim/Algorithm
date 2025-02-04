import Foundation

//print(solution())
print(solution([1, 2, 1, 3, 1, 4, 1, 2]))

// input 데이터 생성
func inputDataCreate() -> [Int] {
    let MAX: Int = 10
    var inputData: [Int] = []
    for num in 1...MAX {
        inputData.append(num)
    }
//    print(inputData)
    return inputData
}

