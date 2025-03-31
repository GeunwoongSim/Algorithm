import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 최종결과값
    var result: [String] = []
    // 주문을 각 원소의 배열로 정리
    let orders = orders.map { Array($0).map { String($0) }.sorted() }
    // 조합때 따른 주문 횟수 (조합에 사용된 개수 : [조합식 : 개수])
    var orderDic: [Int : [String : Int]] = [:]

    // 원소 배열과 개수를 매개변수로 주면 조합해서 배열로 반환
    for order in orders {
        for number in course {
            let arr = makeComb(order, number)
            
            for comb in arr {
                orderDic[number, default: [:]][comb, default: 0] += 1
            }
        }
    }
    
    // 반환받은 값을 개수별로 정렬
    let sortedOrderDic = orderDic.sorted(by: { $0.key < $1.key })
    for (key, value) in sortedOrderDic {
        let findedOrder = findOrder(value)
        result = findedOrder + result
    }
    
    return result.sorted()
}

// 딕셔너리를 전달하면 가장 많이 조합된 메뉴들을 반환 (최소 2번이상, 주문횟수가 같으면 전부 포함)
func findOrder(_ orders: [String : Int]) -> [String] {
    var result: [String] = []
    var maxValue: Int = 0 
    for (key, value) in orders {
        if value < 2 { continue }
        else if value > maxValue {
            maxValue = value
            result = [key]
        } else if value == maxValue {
            result.append(key)
        }
    }
    
    return result
}

// 배열과 개수를 주면 조합으로 만들어서 반환
func makeComb(_ order: [String], _ number: Int) -> [String] {
    var result: [String] = []
    if order.count < number { return result }
    
    func cycle(_ index: Int, _ now: [String]) {
        if now.count == number {
            let str = now.reduce("") { $0 + $1 }
            result.append(str)
            return
        }
        
        for i in index..<order.count {
            cycle(i + 1, now + [order[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}