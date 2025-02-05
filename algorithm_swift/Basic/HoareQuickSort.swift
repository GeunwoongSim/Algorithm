//
//  HoareQuickSort.swift
//  algorithm_swift
//
//  Created by 심근웅 on 2/4/25.
//

import Foundation

func HoareQuickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
    if lo < hi { // 정상적인 범위면
        
        let median = getMedianOfThree(&list, lo: lo, hi: hi)
        let pivot = HoarePartition(&list, lo: lo, hi: hi,median: median)
        
        HoareQuickSort(&list, lo: lo, hi: pivot) // lo ~ pivot (호어는 피봇까지 인걸 주의)
        HoareQuickSort(&list, lo: pivot+1, hi: hi) // pivot 후 ~ hi
    }
}
func HoarePartition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int, median: T) -> Int {
    let pivot = median // 피봇을 중앙값으로 진행
    var i = lo - 1
    var j = hi + 1
    
    while true {
        i += 1
        while list[i] < pivot { i += 1 } // 피봇보다 크거나 같으면 멈춤
        j -= 1
        while list[j] > pivot { j -= 1 } // 피봇보다 작거나 같으면 멈춤
        
        if i >= j { return j } //멈출때까지 갔는데 서로 지나쳤으면 j위치 반환 - [j]가 [i] 보다 작아서 : pivot을 [lo]로 하기 때문
        list.swapAt(i, j) // 멈출때 까지 갔는데 서로 안 지나쳤으면 [i]는 큰값 [j]는 작은값 이므로 둘이 바꾸고 계속 진행
    }
}
func getMedianOfThree<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> T {
    let center: Int = lo + (lo + hi) / 2
    
    
    if list[lo] > list[center] { list.swapAt(lo, center) }
    if list[lo] > list[hi] { list.swapAt(lo, hi)}
    if list[center] > list[hi] { list.swapAt(center, hi) }
    
    list.swapAt(center, hi) //일부러 바꿔둠 - 미리 정렬되어 있어도 순서를 바꿔놓음
    
    return list[hi] // 사실상 중앙값
}
