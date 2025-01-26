import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    return commands.map {
        let s = $0[0]-1, e = $0[1]-1, idx = $0[2]-1
        return array[s...e].sorted()[idx]
    }
}
