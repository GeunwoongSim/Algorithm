//
//  boj2884.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    let inp = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let result = inp[0]*60+inp[1]-45
    if result >= 0 {
        print("\(result/60) \(result%60)")
    }else {
        print("23 \(60+result)")
    }
}
