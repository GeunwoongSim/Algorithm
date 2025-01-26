import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var result: Int = 0
    var arr: [Int] = []
    for inp in ingredient {
        arr.append(inp)
        let comp = arr.suffix(4)
        if comp == [1,2,3,1] {
            arr.removeLast(4)
            result += 1
        }
    }
    
    return result
    
//    var result: Int = 0
//        var arr: [Int] = []
//        for inp in ingredient {
//            arr.append(inp)
//            if arr.count >= 4 && inp == 1 {
//                let idx: Int = arr.count - 1
//                let str = arr[(idx-3)...idx].reduce("",{$0+"\($1)"})
//                if str == "1231" {
//                    arr.removeLast()
//                    arr.removeLast()
//                    arr.removeLast()
//                    arr.removeLast()
//                    result += 1
//                }
//            }
//        }
//        
//        return result
}
