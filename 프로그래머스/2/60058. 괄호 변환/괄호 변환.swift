import Foundation

func solution(_ p:String) -> String {
    // let p = "))(("
    var result: [String] = Array(p).map{ String($0) }
    
    // 올바른 문자열이 아니면 변환 과정을 거침
    if !isCorrect(result) {
        result = recursiveCheck(result)
    }
    
    return result.joined()
}

func recursiveCheck(_ arr: [String]) -> [String] {
    var result: [String] = []
    if arr.isEmpty { return result } // 1

    let divP = divideStr(arr) // 2
    if isCorrect(divP.u) {
        result.append(contentsOf: divP.u)
        result.append(contentsOf: recursiveCheck(divP.v)) // 3-1
    } else {
        result.append("(") // 4-1
        result.append(contentsOf: recursiveCheck(divP.v)) // 4-2
        result.append(")") // 4-3
        var tempU = divP.u
        // 첫번째, 마지막 문자를 제거 해야함
        if !tempU.isEmpty {
            tempU.popLast()
            tempU.removeFirst()
        }
        
        // 4-4
        for val in tempU {
            let inp = (val == "(" ? ")" : "(")
            result.append(inp)
        }
    }
    
    return result // 3-1 , 4-5
}

// u와 v로 분리
func divideStr(_ arr: [String]) -> (u: [String], v: [String]) {
    if arr.isEmpty { return (u: [], v: []) }
    
    var u: [String] = []
    var v: [String] = []
    var flag: Bool = false // false : u에 저장, true : v에 저장
    var balance: Int = 0
    
    for idx in 0..<arr.count {
        balance += (arr[idx] == "(" ? 1 : -1)
        
        if flag {
            v.append(arr[idx])
        } else {
            u.append(arr[idx])
        }
        if balance == 0 { // 현재 idx 까지가 첫 균형잡힌 문자열
            flag = true
        }
    }
    return (u: u, v: v)
}

// 올바른 문자열인지 판별
func isCorrect(_ arr: [String]) -> Bool {
    var stack: [String] = []
    
    for p in arr {
        if p == "(" {
            stack.append("(")
        } else if stack.isEmpty {
            return false 
        } else {
            stack.popLast() 
        }
    }
    return true
}