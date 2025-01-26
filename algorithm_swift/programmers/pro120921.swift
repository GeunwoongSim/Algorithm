import Foundation

func solution(_ A:String, _ B:String) -> Int {
    //A의 합으로 B를 찾기
    let temp = (A+A).components(separatedBy: B)
    return temp.count != 1 ? temp[1].count : -1
    
    var inp: String = A
    for idx in 1..<A.count where A != B {
        inp.insert(inp.removeLast(), at: inp.startIndex)
        print(idx, inp)
        if inp == B { return idx }
    }
    return A==B ? 0 : -1
}

/*
 hellohello
 elloh
 문자열 "hello"에서 각 문자를 오른쪽으로 한 칸씩 밀고 마지막 문자는 맨 앞으로 이동시키면 "ohell"이 됩니다.
 이것을 문자열을 민다고 정의한다면 문자열 A와 B가 매개변수로 주어질 때, A를 밀어서 B가 될 수 있다면 밀어야 하는 최소 횟수를 return하고 밀어서 B가 될 수 없으면 -1을 return 하도록 solution 함수를 완성해보세요.
 "hello"    "ohell"  =>  1
 */
