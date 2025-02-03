
struct PriorityQueue<T: Comparable> {
    private var heap: [T] = [] // 실제 큐
    private let ordered: (T, T) -> Bool // 어떤 우선 순위로 할지
    
    init(ascending: Bool = false, startingValues: [T] = []){
        if ascending { ordered = { $0 > $1 } } // 여기선 값이 큰쪽이 높음
        else { ordered = { $0 < $1 } } // 여기선 값이 낮은쪽이 높음
        heap = startingValues // 초기의 큐를 생성
        var i = heap.count/2 - 1
        while i >= 0 {
            sink(i) // 우선순위에 따라 위치를 잡아줌
            i -= 1
        }
    }
    var count: Int { return self.heap.count }
    var isEmpty: Bool { return self.heap.isEmpty }
    mutating func push(_ element: T) {
        self.heap.append(element)
        swim(heap.count - 1) // 우선순위에 따라 위치를 잡아줌
    }
    mutating func pop() -> T? {
        if self.heap.isEmpty { return nil }
        if self.heap.count == 1 { return self.heap.removeFirst() }
        
        self.heap.swapAt(0, self.heap.count-1)
        let value = self.heap.removeLast()
        sink(0)
        return value
    }
    func peek() -> T? {
        return self.heap.first
    }
    mutating func clear() {
        self.heap.removeAll()
    }
    mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < self.heap.count {
            var j = 2 * index + 1
            if j < (self.heap.count - 1) && ordered(heap[j],heap[j+1]) {
                j += 1
            }
            if !ordered(heap[index],heap[j]) { break } // 바꿔야하는지 판단
            self.heap.swapAt(index, j)
            index = j
        }
    }
    mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1)/2], heap[index]) {
            self.heap.swapAt((index - 1)/2, index)
            index = (index - 1)/2
        }
    }
}
