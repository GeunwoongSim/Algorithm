import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var xMap: [Int] = []
    var yMap: [Int] = []
    let paper: [[String]] = wallpaper.map{ Array($0).map{String($0)} }
    for y in 0..<paper.count {
        for x in 0..<paper[y].count {
            if paper[y][x] == "#" {
                xMap.append(x)
                yMap.append(y)
            }
        }
    }
    xMap.sort()
    yMap.sort()
    return [yMap.first!,xMap.first!,yMap.last!+1, xMap.last!+1]
}
