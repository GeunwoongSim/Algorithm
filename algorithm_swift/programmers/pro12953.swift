func solution(_ arr:[Int]) -> Int {
    var num: Int = arr[0]
    for idx in 1..<arr.count {
        let gc = gcd(num, arr[idx])
        num = (num * arr[idx]) / gc
    }
    return num
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    let minN: Int = min(num1, num2)
    let maxN: Int = max(num1, num2)
    return maxN % minN == 0 ? minN : gcd(minN, maxN%minN)
}

func lcm(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2 / gcd(num1,num2)
}
