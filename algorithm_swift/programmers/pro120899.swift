import Foundation

func solution(_ array:[Int]) -> [Int] {
    //max 활용
    guard let max = array.enumerated().max(by: { $0.element < $1.element }) else{
        return []
    }
    return [max.element, max.offset]
    
    
    //단순계산
    var result: [Int] = [array[0], 0]
    for index in 0..<array.count{
        if result[0] < array[index]{
            result[0] = array[index]
            result[1] = index
        }
    }
    return result
}

/*
 정수 배열 array가 매개변수로 주어질 때, 가장 큰 수와 그 수의 인덱스를 담은 배열을 return 하도록 solution 함수를 완성해보세요.
 */
