func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcdNum = gcd(n,m)
    let lcmNum = n*m / gcdNum
    return [gcdNum,lcmNum]
}

func gcd(_ n: Int, _ m: Int) -> Int { //최대 공약수
    return n%m==0 ? m : gcd(m,n%m)
}
