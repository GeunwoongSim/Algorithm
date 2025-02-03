
struct Stack<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        self.elements.append(element)
    }
    mutating func pop() -> T? {
        return self.elements.popLast()
    }
    func peek() -> T? {
        return self.elements.last
    }
    var isEmpty: Bool { return self.elements.isEmpty }
    var count: Int { return self.elements.count }
    var capacity: Int {
        get { self.elements.capacity }
        set { self.elements.reserveCapacity(newValue) }
    }
    func isFull() -> Bool {
        return self.capacity == self.count
    }
}
extension Stack: ExpressibleByArrayLiteral { // 배열형태로 초기화
    public init(arrayLiteral elements: T...) {
        self.init(elements: elements)
    }
}
extension Stack: Sequence, IteratorProtocol { // 순환 가능
    mutating func next() -> T? {
        return self.elements.popLast()
    }
}
