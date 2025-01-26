import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int{
    var answer = 0
    var a: Int = a-1, b: Int = b-1
    while a != b {
        a = a/2
        b = b/2
        answer += 1
    }
    return answer
}

/*
 그리고, 1번↔2번, 3번↔4번, ... , N-1번↔N번의 참가자끼리 게임을 진행
 처음 라운드에서 A번을 가진 참가자는 경쟁자로 생각하는 B번 참가자와 몇 번째 라운드에서 만나는지 궁금
 게임 참가자 수 N, 참가자 번호 A, 경쟁자 번호 B
 
 */
