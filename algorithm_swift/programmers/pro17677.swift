

func makeArr(_ strs: [String]) -> [String] { // 한글자씩 담긴 배열을 넘기면 다중집합으로 만들어서 반환
    var result: [String] = []
    for idx in 0..<strs.count-1 {
        if ((strs[idx] >= "a" && strs[idx] <= "z") || (strs[idx] >= "A" && strs[idx] <= "Z")) && ((strs[idx+1] >= "a" && strs[idx+1] <= "z") || (strs[idx+1] >= "A" && strs[idx+1] <= "Z"))  { // 두 값이 알파벳 일떄만 추가
            result.append(strs[idx].uppercased()+strs[idx+1].uppercased()) // 값은 항상 대문자로 저장(대문자를 구별하지 않기 위함)
        }
    }
    return result.sorted()
}

func makeInter(_ arr1: [String], _ arr2: [String]) -> [String] { // 교집합 생성
    var arr1Idx: Int = 0
    var arr2Idx: Int = 0
    var result: [String] = []
    while arr1Idx < arr1.count && arr2Idx < arr2.count {
        if arr1[arr1Idx] < arr2[arr2Idx] {
            arr1Idx += 1
        }else if arr1[arr1Idx] > arr2[arr2Idx] {
            arr2Idx += 1
        }else { // 두값이 같은 경우
            result.append(arr1[arr1Idx])
            arr1Idx += 1
            arr2Idx += 1
        }
    }
    return result
}
func makeUnion(_ arr1: [String], _ arr2: [String], _ interSection: [String]) -> [String] { // 합집합 생성
    var result: [String] = (arr1 + arr2).sorted()
    for inter in interSection {
        let idx = result.firstIndex(of: inter)!
        result.remove(at: idx)
    }
    return result
}

func solution(_ str1:String, _ str2:String) -> Int {
    
    let str1Arr: [String] = makeArr(str1.map { String($0) })
    let str2Arr: [String] = makeArr(str2.map { String($0) })

    let interSection: [String] = makeInter(str1Arr, str2Arr)
    let union: [String] = makeUnion(str1Arr, str2Arr, interSection)
    
    if union.count == 0 { // 공집합으로 나눌 수 없으니 유사도 1
        return 65536
    }else if interSection.count == 0 { // 합집합은 공집이 아니라서 유사도 0
        return 0
    }
    return Int((Double(interSection.count) / Double(union.count)) * 65536)
}
