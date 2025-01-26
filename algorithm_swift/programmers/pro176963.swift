import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let dic: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name,yearning))
    return photo.map{ $0.reduce(0){ $0+(dic[$1] ?? 0)} }
//    var dic: [String: Int] = [:]
//    zip(name,yearning).forEach{ dic[$0.0] = $0.1 }
//    return photo.map{ $0.filter{ dic[$0] != nil }.reduce(0){ $0+dic[$1]! } }
}
