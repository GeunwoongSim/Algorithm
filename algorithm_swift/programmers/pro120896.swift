import Foundation

func solution(_ s:String) -> String {
    var dic: [String:Int] = [:]
    for str in s{
        let key: String = String(str)
        dic[key] = (dic[key]==nil) ? 1 : dic[key]!+1
    }
    return dic.sorted(by: {$0.key < $1.key}).filter{$0.value == 1}.map{$0.key}.joined()
}
/*
 문자열 s가 매개변수로 주어집니다. s에서 한 번만 등장하는 문자를 사전 순으로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요. 한 번만 등장하는 문자가 없을 경우 빈 문자열을 return 합니다.
 "abcabcadc" => "d"
 */
