import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    
    let width: Int64 = Int64(min(w, h))
    let height: Int64 = Int64(max(w, h))
    
    // let incline: Double = Double(height) / Double(width)
    let gcdNum = gcd(height, width)
    let tempW: Int64 = width / gcdNum
    let tempH: Int64 = height / gcdNum
    
    var result: Int64 = width * height

    for i in 1...tempW {
        let x0 = i-1
        let Dy0 = (Double(height) * Double(x0)) / Double(width)
        let y0 = Int64(Dy0)
        let x1 = i
        let Dy1 = (Double(height) * Double(x1)) / Double(width) 
        var y1 = Int64(Dy1)
        if Dy1 - Double(y1) > 0 {
            y1 += 1
        }
        result -= (y1-y0) * gcdNum
    }
    
    
    return result
}

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}