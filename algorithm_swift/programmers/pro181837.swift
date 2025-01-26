import Foundation

func solution(_ order:[String]) -> Int {
    return order.map{ $0.contains("cafelatte") ? 5000 : 4500 }.reduce(0,+)
    
    return order.map{
        if $0.contains("americano"){
            return 4500
        }else if $0.contains("cafelatte"){
            return 5000
        }else {
            return 4500
        }
    }.reduce(0,+)
}

/*
 아메리카노 : 라테 = 4500 : 5000
 메뉴만 - 차가운것 / 아무거나 - 차가운 아메리카노

 각 직원이 적은 메뉴가 문자열 배열 order로 주어질 때, 카페에서 결제하게 될 금액을 return 하는 solution 함수를 작성해주세요. order의 원소는 아래의 것들만 들어오고, 각각의 의미는 다음과 같습니다.
 */
