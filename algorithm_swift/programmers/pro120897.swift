import Foundation

func solution(_ n:Int) -> [Int] {
    return (1...n).filter{ n%$0 == 0 }
    
    //힘들게 약수를 구하지 말고 걍 전부 나누자
    let maxIndex: Int = Int(sqrt(Double(n)))
    var result: [Int] = []
    for index in 1...maxIndex{
        if n%index == 0 {
            result.append(index)
            if n/index != index{
                result.append(n/index)
            }
        }
    }
    return result.sorted(by: <)
}

/*
 정수 n이 매개변수로 주어질 때, n의 약수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요
 */
