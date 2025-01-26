//
//  boj10809.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation
func solution(){
    var result: [Int] = [Int](repeating: -1, count: 26)
    for temp in readLine()!.enumerated(){
        let point = Int(temp.element.asciiValue!) - 97
        if result[point] == -1 { //이전에 안나왔으면 위치 저장
            result[point] = temp.offset
        }
    }
    result.map{print($0,terminator: " ")}
}
