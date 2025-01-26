//
//  boj2675.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation
func solution(){
    let T: Int = Int(readLine()!)!
    for _ in 1...T{
        let inp = readLine()!.split(separator: " ").map{String($0)}
        var result: String = ""
        for char in inp[1]{
            for _ in 1...Int(inp[0])!{
                result += String(char)
            }
        }
        print(result)
    }
}
