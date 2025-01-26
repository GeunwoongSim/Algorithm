//
//  boj10250.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    for _ in 1...T{
        let inp = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let H: Int = inp[0]
        let N: Int = inp[2]
        if N % H != 0 {
            if N/H+1 < 10 { print("\(N%H)0\(N/H+1)") }
            else { print("\(N%H)\(N/H+1)") }
        }
        else {
            if N/H < 10 { print("\(H)0\(N/H)") }
            else { print("\(H)\(N/H)") }
        }
    }
}
