func solution(_ phone_number:String) -> String {
    
    return String(repeating: "*", count: phone_number.count-4)+phone_number.suffix(4)
    
    return phone_number.enumerated().map{
        if $0.offset < phone_number.count-4 {
            return"*"
        }
        return String($0.element)
    }.joined()
}
