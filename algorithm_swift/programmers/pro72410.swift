import Foundation

func solution(_ new_id:String) -> String {
    var new_id = new_id
//    print("0: ",new_id)
    
     //1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    new_id = new_id.map{ $0.isUppercase ? $0.lowercased() : String($0) }.joined()
//    print("1: ",new_id)
    
    //2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    new_id = new_id.filter{ $0.isLowercase || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."}
//    print("2: ",new_id)
    
    //3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    while new_id.contains("..") {
        new_id = new_id.replacingOccurrences(of: "..", with: ".")
    }
//    print("3: ",new_id)
    
    //4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    if new_id.last == "." { new_id.removeLast() }
    if new_id.first == "." { new_id.removeFirst() }
//    print("4: ",new_id)
    
    //5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if new_id.isEmpty { new_id = "a" }
//    print("5: ",new_id)
    
    //6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다. 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if new_id.count >= 16 { new_id = String(new_id.prefix(15)) }
    if new_id.last == "." { new_id.removeLast() }
//    print("6: ",new_id)
    
    //7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    if new_id.count <= 2 {
        for _ in 0..<(3-new_id.count) {
            new_id.append(new_id.last!)
        }
    }
    
//    print("7: ",new_id)
    
    
    return new_id
}
