func solution(_ s:String) -> String {
    let arr = Array(arrayLiteral: s)
    print(arr)
    let str: [String] = s.map{String($0)}
    let idx: Int = str.count / 2
    return str.count%2 == 0 ? str[idx-1]+str[idx] : str[idx]
}
