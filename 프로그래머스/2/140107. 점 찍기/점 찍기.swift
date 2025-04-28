import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {    
    let d: Int64 = Int64(d)
    let k: Int64 = Int64(k)
    
    var i: Int64 = 0
    var result: Int64 = 0
    
    while i*i <= d*d {
        let temp: Int64 = d*d - i*i
        let y: Double = sqrt(Double(temp))
        // print("x: \(i), y: \(y)")
        
        if i % k == 0 {
            result += Int64(y) / k + 1
        }
        
        i += 1
    }
    
    return result
}