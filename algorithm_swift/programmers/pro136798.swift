import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var arr: [Int] = [Int](repeating: 0, count: number+1)
    for num in 1...number{
        var gesu: Int = 0
        for idx in 1...Int(sqrt(Double(num))) {
            if num % idx == 0 {
                if idx == (num / idx) { gesu += 1 }
                else { gesu += 2 }
            }
            if gesu > limit {
                gesu = power
                break
            }
        }
        arr[num] = gesu
    }
    return arr.reduce(0,+)
}


/*
 약수 구하기
 1. 1~number 까지 나누어보기
 2. 1~number/2 까지 나누어 보기
 3. 1~sqrt(number) 까지 나누어 보기
 */
