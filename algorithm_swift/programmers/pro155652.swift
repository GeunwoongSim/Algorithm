import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alpha: [String] = (97...122).map { String(Unicode.Scalar($0)!) }.filter{ !skip.contains($0) }
    return Array(s).map{String($0)}.map{alpha[(alpha.firstIndex(of: $0)! + index)%alpha.count]}.joined()
//    return Array(s).map{String($0)}.map{alpha[(alpha.firstIndex(of: $0)! + index)%alpha.count]}.reduce("",+)
}
