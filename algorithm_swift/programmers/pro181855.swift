import Foundation

func solution(_ strArr:[String]) -> Int {
    var arrResult: [Int] = [Int](repeating: 0, count: 31)
    for str in strArr {
        arrResult[str.count] += 1
    }
    return arrResult.max()!
    
    //dictionary로 안하고 배열의 index에 접근해도 됨
    var result: [Int:Int] = [:]
    for str in strArr {
        if result[str.count] == nil {
            result[str.count] = 1
        } else {
            result[str.count] = result[str.count]! + 1
        }
    }
    return result.sorted(by: {$0.value > $1.value})[0].value
}

/*
 문자열 배열 strArr이 주어집니다. strArr의 원소들을 길이가 같은 문자열들끼리 그룹으로 묶었을 때 가장 개수가 많은 그룹의 크기를 return 하는 solution 함수를 완성해 주세요.
 ["a","bc","d","efg","hi"] => 2
 */
