import Foundation

func solution(_ n:Int) -> Int {
    return (2...n).filter{n%$0==1}[0]
}
