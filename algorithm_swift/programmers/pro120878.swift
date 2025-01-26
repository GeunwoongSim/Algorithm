import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    var B = (1...a).reversed().filter{ (a%$0==0) && (b%$0==0) }.map{b/$0}.first!
    var num = 2
    var result: [Int] = []
    while B != 1 {
        if B%num == 0{
            result.append(num)
            B = B/num
        }else{
            num = num + 1
        }
    }
    return (result.filter{$0 != 2 && $0 != 5}.count) == 0 ? 1 : 2
}

/*
 소수점 아래 숫자가 계속되지 않고 유한개인 소수를 유한소수라고 합니다. 분수를 소수로 고칠 때 유한소수로 나타낼 수 있는 분수인지 판별하려고 합니다. 유한소수가 되기 위한 분수의 조건은 다음과 같습니다.

 기약분수로 나타내었을 때, 분모의 소인수가 2와 5만 존재해야 합니다.
 두 정수 a와 b가 매개변수로 주어질 때, a/b가 유한소수이면 1을, 무한소수라면 2를 return하도록 solution 함수를 완성해주세요.
 
 7    20    => 1

 분자와 분모의 최대공약수로 약분하면 기약분수를 만들 수 있습니다.
 정수도 유한소수로 분류합니다.

 
 */
