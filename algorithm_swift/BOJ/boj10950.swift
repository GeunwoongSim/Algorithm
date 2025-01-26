//
//  boj10950.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let T: Int = Int(readLine()!)!
    for _ in 1...T {
        print(readLine()!.components(separatedBy: " ").map{Int($0)!}.reduce(0){$0+$1})
    }
}
