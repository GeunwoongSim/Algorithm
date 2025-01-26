import Foundation

func solution(_ hp:Int) -> Int {
    //단순계산
    var result1: Int = hp/5 + (hp%5)/3 + (hp%5)%3
    //dp
    var result: [Int] = Array(repeating: 0, count: 1001)
    result[0...5] = [0,1,2,1,2,1]
    for index in 6...1000{
        result[index] = min(min(result[index-1],result[index-3]),result[index-5]) + 1
    }
    return result1
}

/*
 장군개미는 5의 공격력을, 병정개미는 3의 공격력을 일개미는 1의 공격력을 가지고 있습니다.
 사냥감의 체력 hp가 매개변수로 주어질 때, 사냥감의 체력에 딱 맞게 최소한의 병력을 구성하려면 몇 마리의 개미가 필요한지를 return하도록 solution 함수를 완성해주세요.
 */
