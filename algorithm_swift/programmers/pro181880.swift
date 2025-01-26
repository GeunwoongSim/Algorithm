import Foundation

func solution(_ num_list:[Int]) -> Int {
    var list: [Int] = [Int](repeating: 0, count: 31)
    for idx in 2...30{
        if idx%2 == 0 {
            list[idx] = list[idx/2] + 1
        }else{
            list[idx] = list[(idx-1)/2] + 1
        }
    }
    return num_list.map{list[$0]}.reduce(0,+)
}
