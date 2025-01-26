func solution(_ seoul:[String]) -> String {
    
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
    
    
    let offset: Int = seoul.enumerated().filter{$0.element == "Kim"}[0].offset
    return "김서방은 \(offset)에 있다"
}
