//
//  boj2438.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = Int(readLine()!)!
    for y in 1...input {
        for _ in 1...y {
            print("*",terminator: "")
        }
        print("")
    }
}
