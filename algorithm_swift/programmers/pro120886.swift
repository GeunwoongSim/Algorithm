import Foundation

func solution(_ before:String, _ after:String) -> Int {
    
    //문자의 순서를 정렬해서 두 문자열 비교
    let str1 = ArraySlice(before).sorted().map{String($0)}.joined()
    let str2 = ArraySlice(after).sorted().map{String($0)}.joined()
    return str1 == str2 ? 1 : 0
    
    //한개씩 제거해서 비교
    var a = after
    for st in before {
        if a.contains(st){
            a.remove(at: a.firstIndex(of: st)!)
        }
    }
    return a.count == 0 ? 1 : 0
}
