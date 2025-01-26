import Foundation

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    let str: String = my_string.map{ String($0) }[s...e].reversed().joined()
    let strPre: String = String(my_string.prefix(s))
    let strSuf: String = String(my_string.suffix(my_string.count-1-e))
    return strPre + str + strSuf
    

    let arr: [String] = my_string.map{ String($0) }[s...e].reversed()
    return String(my_string.prefix(s))+arr.joined()+String(my_string.suffix(my_string.count-e-1))
}

/*
 문자열 my_string과 정수 s, e가 매개변수로 주어질 때, my_string에서 인덱스 s부터 인덱스 e까지를 뒤집은 문자열을 return 하는 solution 함수를 작성해 주세요.
 "Progra21Sremm3", 6, 12 => "ProgrammerS123"
 */
