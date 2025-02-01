import Foundation

func solution(_ s:String) -> [Int] {
    var inputArr: [[Int]] = []
    var result: [Int] = []
    // 입력값 정리
    let input = s.components(separatedBy: "},")
    for str in input {
        var temp = str.replacingOccurrences(of: "{", with: "")
        temp = temp.replacingOccurrences(of: "}", with: "")
        var arr: [Int] = []
        for num in temp.split(separator: ",") {
            let number: Int = Int(String(num))!
            arr.append(number)
        }
        inputArr.append(arr)
    }

    //튜플 구하기
    let sortArrs = inputArr.sorted(){ return $0.count < $1.count }
    for sortArr in sortArrs {
        for num in sortArr {
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result
}
