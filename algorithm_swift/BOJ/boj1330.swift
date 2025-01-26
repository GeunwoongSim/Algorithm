//
//  boj1330.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//


import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    switch (input[0] - input[1]) {
    case ..<0 : print("<")
    case 1... : print(">")
    default: print("==")
    }
}
