import Foundation

func solution(_ s:String) -> Bool {
    var stack: [String] = []
    var result: Bool = true
    for str in s {
        if str == "(" { stack.append(String(str)) }
        else{ // )
            if stack.isEmpty {
                result = false
                break
            }else {
                stack.removeLast()
            }
        }
    }
    return stack.isEmpty ? result : false
}
