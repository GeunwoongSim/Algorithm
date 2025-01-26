import Foundation

/*
 - cal로 계산했으나 연산횟수 초과로 시간초과 발생 -> 메모리제이션으로 시간단축
 - cal을 재귀함수로 구현했으나 메모리초과가 발생해서 반복문으로 바꿈
 
 => 다른사람의 풀이를 본 후 : x와 y중 큰 수 +1이 해당 칸의 수
 */

func cal(_ idx: Int64, _ n: Int64) -> Int{
    let x = idx % n
    let y = idx / n
    
    var num = y+1
    for i in 0...x {
        if i >= num { num += 1 }
    }
    return Int(num)
}

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    let n = Int64(n)
    var array: [Int] = []
    
    for idx in left...right {
        let x = idx % n
        let y = idx / n
        var value: Int = 0
        
        if x == 0 { value = Int(y)+1 }
        else if array.count == 0 { value = cal(idx, n) }
        else if x <= y { value = array.last! }
        else { value = array.last! + 1 }
        
        array.append(value)
    }
    return array
}
