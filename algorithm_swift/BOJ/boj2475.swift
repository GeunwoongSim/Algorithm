//
//  boj2475.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation
func solution(){
    print(readLine()!.components(separatedBy: " ").map{ Int($0)! }.reduce(0){$0+$1*$1}%10)
}
