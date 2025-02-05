
import Foundation

func mergeSort<T: Comparable>(_ list: [T]) -> [T] { // 분할, 결합
    if list.count < 2 { return list }
    
    let center = list.count / 2
    let S1 = [T](list[..<center])
    let S2 = [T](list[center...])
    
    return merge(mergeSort(S1),mergeSort(S2))
}
func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] { // 정복(정렬)
    var mergeList: [T] = []
    var leftIdx: Int = 0
    var rightIdx: Int = 0
    // 정렬해서 mergeList에 담음
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            mergeList.append(left[leftIdx])
            leftIdx += 1
        }else if right[rightIdx] < left[leftIdx] {
            mergeList.append(right[rightIdx])
            rightIdx += 1
        }else {
            mergeList.append(left[leftIdx])
            mergeList.append(right[rightIdx])
            leftIdx += 1
            rightIdx += 1
        }
    }
    // 남은거는 그냥 뒤에 붙임
    mergeList += [T](left[leftIdx..<left.count])
    mergeList += [T](right[rightIdx..<right.count])
    return mergeList
}
