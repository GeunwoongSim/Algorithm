import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    return zip(str1, str2).map{ String($0.0)+String($0.1) }.joined()
    
    let strArr1 = str1.map{ String($0) }
    let strArr2 = str2.map{ String($0) }
    var result: String = ""
    for index in 0..<strArr1.count {
        result += strArr1[index]
        result += strArr2[index]
    }
    
    return result
}

/*
 길이가 같은 두 문자열 str1과 str2가 주어집니다.

 두 문자열의 각 문자가 앞에서부터 서로 번갈아가면서 한 번씩 등장하는 문자열을 만들어 return 하는 solution 함수를 완성해 주세요.
 */
