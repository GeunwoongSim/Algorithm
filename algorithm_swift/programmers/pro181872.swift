import Foundation

func solution(_ myString:String, _ pat:String) -> String {
    guard let ran = myString.range(of: pat, options: .backwards) else {
        return ""
    }
    print(myString.prefix(upTo: ran.upperBound))
    
    
    //맨뒤에서 한글자씩 빼서 hasSuffix로 pat이 마지막 문자열인지 확인 - true면 가장 긴 문자열
    var result: String = myString
    while result.hasSuffix(pat) == false {
        result.removeLast()
    }
    return result
    
    
    
    for idx in 0...(myString.count-pat.count) {
        //prefix로 부분 문자열을 생성
        let str = myString.prefix(myString.count-idx)
        //suffix로 마지막 문자열이 pat이랑 같은지 비교
        let suf = str.suffix(pat.count)
        if suf == pat {
            return String(str)
        }
    }
    return ""
}
