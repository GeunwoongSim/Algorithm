import Foundation

func solution(_ elements:[Int]) -> Int {
    let c: Int = elements.count
    var result: Set<Int> = Set<Int>()
    //부분 수열 생성
    for leng in 0..<c { //부분 수열의 길이
        print("\(leng+1)자리 수열 ",terminator: " ")
        for start in 0..<c { //부분 수열의 시작 인덱스
            var sum: Int = 0
            for idx in 0...leng { //시작부터 길이만큼의 수열 접근
                print(elements[(start+idx)%c], terminator: "")
                sum += elements[(start+idx)%c]
            }
            print("",terminator: " ")
            result.insert(sum)
        }
        print()
    }
    return result.count
}
