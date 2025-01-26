import Foundation

func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    //prefix로 앞에서 부터 s+l 길이까지 끊고 suffix로 뒤에서부터 글자수 맞춤
    return intStrs.map{ $0.prefix(s+l).suffix(l) }.map{ Int($0)! }.filter{ $0 > k }
    
    //for문
    var result: [Int] = []
    for str in intStrs {
        let arr = ArraySlice(str).map{String($0)}
        var num: String = ""
        for idx in s..<s+l {
            num += arr[idx]
        }
        if Int(num)! > k {
            result.append(Int(num)!)
        }
    }
    
    
    //filter / map 활용
    var result: [Int] = []
    for str in intStrs {
        let v:Int = Int(str.enumerated().filter{ ($0.offset >= s) && ($0.offset < s+l) }.map{ String($0.element)}.joined())!
        if v > k {
            result.append(v)
        }
    }
    return result
}

/*
 문자열 배열 intStrs와 정수 k, s, l가 주어집니다. intStrs의 원소는 숫자로 이루어져 있습니다.

 배열 intStrs의 각 원소마다 s번 인덱스에서 시작하는 길이 l짜리 부분 문자열을 잘라내 정수로 변환합니다. 이때 변환한 정수값이 k보다 큰 값들을 담은 배열을 return 하는 solution 함수를 완성해 주세요.
 ["0123456789","9876543210","9999999999999"]    50000    5    5
 => [56789, 99999]
 */
