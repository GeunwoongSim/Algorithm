
struct Queue<T> {
    private var elements: [T] = []
    mutating func enqueue(_ element: T) {
        self.elements.append(element)
    }
    mutating func dequeue() -> T? {
        if self.isEmpty { return nil }
        return self.elements.removeFirst()
    }
    func front() -> T? {
        return self.elements.first
    }
    mutating func clear() {
        self.elements.removeAll()
    }
    var isEmpty: Bool { return self.elements.isEmpty }
    var count: Int { return self.elements.count }
    var capacity: Int {
        get { return self.elements.capacity }
        set { self.elements.reserveCapacity(newValue) }
    }
    func isFull() -> Bool {
        return self.capacity == self.count
    }
}

extension Queue: ExpressibleByArrayLiteral { // 배열형태로 초기화
    public init(arrayLiteral elements: T...) {
        self.init(elements: elements)
    }
}
extension Queue: Sequence,IteratorProtocol { // 순환 가능
    mutating func next() -> T? {
        if self.elements.isEmpty { return nil }
        return self.elements.removeFirst()
    }
}
