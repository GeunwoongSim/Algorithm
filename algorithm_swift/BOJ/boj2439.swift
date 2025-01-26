//
//  boj2439.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let num = Int(readLine()!)!
    for y in 1...num {
        for _ in 0..<(num-y) {
            print(" ",terminator: "")
        }
        for _ in 1...y {
            print("*", terminator: "")
        }
        print("")
    }
}
