import Foundation

func solution(_ n:Int) -> Int {
    var ans: Int = 0
    var num: Int = n
    
    while num != 1 {
        if num % 2 == 0 { num = num / 2 }
        else { 
            num = (num-1) / 2
            ans += 1
        }
    }
    return ans+1
}


/*
 K 칸을 앞으로 점프하거나, (현재까지 온 거리) x 2 에 해당하는 위치로 순간이동
 순간이동을 하면 건전지 사용량이 줄지 않지만, 앞으로 K 칸을 점프하면 K 만큼의 건전지 사용량이 듭니다.
 점프로 이동하는 것은 최소, 건전지 사용량의 최솟값을 return
 */
