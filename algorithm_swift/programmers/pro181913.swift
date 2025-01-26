import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var result: [String] = my_string.map {String($0)}
    for q in queries {
        let s = q[0]
        let e = q[1]
//        result.replaceSubrange(s...e, with: result[s...e].reversed())
//        result[s...e].reverse()
    }
    return result.joined()
    
    
    
    var arr1: [String] = my_string.map{ String($0) }
    var arr2: [String] = Array(repeating: "", count: arr1.count)
    for query in queries {
        let s = query[0]
        let e = query[1]
        for idx in 0..<arr1.count{
            if idx >= s && idx <= e {
                arr2[idx] = arr1[e-(idx-s)]
            }else {
                arr2[idx] = arr1[idx]
            }
        }
        arr1 = arr2
    }
    
    return arr1.joined()
}
/*
 문자열 my_string과 이차원 정수 배열 queries가 매개변수로 주어집니다.
 
 queries의 원소는 [s, e] 형태로, my_string의 인덱스 s부터 인덱스 e까지를 뒤집으라는 의미입니다. my_string에 queries의 명령을 순서대로 처리한 후의 문자열을 return 하는 solution 함수를 작성해 주세요.
 
 "rermgorpsam"    [[2, 3], [0, 7], [5, 9], [6, 10]]    "programmers"
 */
