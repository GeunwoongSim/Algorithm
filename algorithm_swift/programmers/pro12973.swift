import Foundation

func solution(_ s:String) -> Int{
    var stack: [String] = []
    let strs: [String] = s.map{ String($0) }
    for str in strs {
        if stack.isEmpty { stack.append(str) } //비어있으면 삽입
        else if stack.last! != str { stack.append(str) } //stack의 가장 위 값이 현재 str값과 다르면 삽입
        else { //비어있지 않고 stack의 가장 위 값이 현재 str값과 같으면 last 삭제
            stack.removeLast()
        }
    }
    return stack.isEmpty ? 1 : 0
}

