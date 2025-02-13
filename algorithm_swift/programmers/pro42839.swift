import Foundation

func solution(_ numbers:String) -> Int {
    var result: Int = 0
    // 우선 숫자 만들기
    let numbers: [Int] = makeNumber(numbers).sorted()
    for number in numbers {
        if check(number) { result += 1}
    }
    return result
}

func check(_ number: Int) -> Bool { // 소수면 true, 아니면 false
    if number < 4 { return number >= 2 ? true : false }
    // 4이상 일때 진행
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 { return false }
    }
    return true
}

func makeNumber(_ numbers: String) -> Set<Int> {
    let inputs: [String] = numbers.map{ String($0) }
    // $0: numbers 중 숫자를 만드는데 사용한 인덱스, $1: 그렇게 만들어진 숫자
    var numArrs: [([Int], String)] = numbers.enumerated().map{ ([$0.offset],String($0.element))}
    var madeNumSet: Set<Int> = []
    var idx: Int = 0 // numArrs에 접근하는 idx
    while idx < numArrs.count{
        let usedIdx: [Int] = numArrs[idx].0 // 이전에 사용한 numbers의 인덱스
        let num: String = numArrs[idx].1 // 그렇게 만들어진 숫자
        
        for i in 0..<numbers.count { // 새로운 숫자를 생성
            if usedIdx.contains(i) { // 이전에 사용한 숫자는 패스
                continue
            }
            numArrs.append((usedIdx + [i], num+inputs[i]))
        }
        idx += 1
    }
    for numArr in numArrs {
        if let num = Int(numArr.1) {
            madeNumSet.insert(num)
        }
    }
    return madeNumSet
}
