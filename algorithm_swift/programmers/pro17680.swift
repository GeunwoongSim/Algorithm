import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cities = cities.map { $0.uppercased() } // 대소문자를 구별하지 않음
    var cacheCities: [String] = [String](repeating: "", count: 0)
    var totalTime: Int = 0
    
    if cacheSize == 0 { // 1. 캐시 사이즈가 0이면 도시수 * 5
        totalTime = cities.count * 5
    }else {
        for city in cities {
            // 2. city가 캐시에 들어있는지 확인
            var check: Bool = false //캐시에 들어있으면 true, 없으면 false
            for cacheCity in cacheCities.enumerated() {
                if city == cacheCity.element { // 3. city가 캐시에 들어있음
                    totalTime += 1
                    cacheCities.remove(at: cacheCity.offset) // 기존의 내용을 삭제
                    cacheCities.append(cacheCity.element) // 캐시를 새롭게 정리
                    check = true
                    break
                }
            }
            if !check { //캐시에 들어있지않으면
                totalTime += 5
                if cacheCities.count == cacheSize { // 캐시가 가득찾으면 가장 처음에 넣은 캐시 값 삭제
                    cacheCities.removeFirst()
                }
                cacheCities.append(city) // 캐시에 저장
            }
        }
    }
    return totalTime
}
