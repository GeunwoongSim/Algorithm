import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    return (i...j).map{
        String($0).map{ String($0) }.filter{$0 == String(k)}.count
    }.reduce(0,+)
    
    let com: String = String(k)
    var result: Int = 0
    for str in i...j {
        for num in String(str){
            if String(num) == com{
                result += 1
            }
        }
    }
    return result
}
