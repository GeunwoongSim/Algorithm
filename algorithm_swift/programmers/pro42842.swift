import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let z: Int = brown - 4
    for x in 1...z/4 {
        let y = z/2 - x
        if (x+2) * (y+2) - brown == yellow {
            return [max(x+2,y+2),min(x+2,y+2)]
        }
    }
    return []
}
