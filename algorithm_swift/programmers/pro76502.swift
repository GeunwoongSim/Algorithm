import Foundation

func solution(_ s:String) -> Int {
    var inp: [String] = s.map{ String($0) }
    var result: Int = 0
    for _ in 0..<s.count {
        var stack: [String] = []
        var toggle: Bool = true
        for cha in inp {
            if cha == "(" || cha == "{" || cha == "[" { //여는 괄호는 스택에 넣음
                stack.append(cha)
            }else if stack.isEmpty { //닫는 괄호가 나왔지만 스택이 비어있음 - 실패
                toggle = false
                break
            }else if (cha == ")" && stack.last == "(") || (cha == "}" && stack.last == "{") || (cha == "]" && stack.last == "[") {
                stack.removeLast()
            }else { //닫는 괄호가 나왔고 스택의 마지막값과 다름 - 실패
                toggle = false
                break
            }
        }
        //괄호짝을 맞추고 마지막에 스택이 비어있으면 성공
        if toggle && stack.isEmpty {
            result += 1
        }
        inp.append(inp.removeFirst())
    }
    return result
}
