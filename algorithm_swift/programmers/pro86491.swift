import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let size = sizes.map{$0.sorted()}.reduce((0,0)){ (max($0.0,$1[0]), max($0.1,$1[1])) }
    return size.0 * size.1
    
    
    var sizes = sizes.map{$0.sorted()}
    var width: Int = sizes[0][0]
    var height: Int = sizes[0][1]
    for num in 1..<sizes.count {
        if width < sizes[num][0] { width = sizes[num][0] }
        if height < sizes[num][1] { height = sizes[num][1] }
    }
    return width * height
}
