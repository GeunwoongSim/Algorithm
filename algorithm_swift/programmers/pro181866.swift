import Foundation

func solution(_ myString:String) -> [String] {
//    return myString.components(separatedBy: "x").filter{ $0 != "" }.sorted()
    
    
    
    let arr: [String] = myString.components(separatedBy: "x")
    var result: [String] = []
    for val in arr {
        if val != "" {
            result.append(val)
        }
    }
    return result.sorted()
}

/*
 문자열 myString이 주어집니다. "x"를 기준으로 해당 문자열을 잘라내 배열을 만든 후 사전순으로 정렬한 배열을 return 하는 solution 함수를 완성해 주세요.

 단, 빈 문자열은 반환할 배열에 넣지 않습니다.
 */
