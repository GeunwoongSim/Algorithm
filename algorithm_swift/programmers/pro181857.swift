import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var result: [Int] = arr
    let comp: [Int] = [1,2,4,8,16,32,64,128,256,512,1024,2048]
    var maxIdx: Int = 0
    while comp[maxIdx] < arr.count {
        maxIdx = maxIdx + 1
    }
    for _ in 0..<(comp[maxIdx] - arr.count){
        result.append(0)
    }
    return result
}

/*
 정수 배열 arr이 매개변수로 주어집니다. arr의 길이가 2의 정수 거듭제곱이 되도록 arr 뒤에 정수 0을 추가하려고 합니다. arr에 최소한의 개수로 0을 추가한 배열을 return 하는 solution 함수를 작성해 주세요.
 [1, 2, 3, 4, 5, 6] => [1, 2, 3, 4, 5, 6, 0, 0]
 */
