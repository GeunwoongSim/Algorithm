//
//  boj2562.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    var arr: [(Int,Int)] = []
    for idx in 1...9{
        let num: (Int,Int) = (Int(readLine()!)!, idx)
        arr.append(num)
    }
    arr.sort{$0.0 > $1.0}
    print(arr)
    print(arr[0].0)
    print(arr[0].1)
}
