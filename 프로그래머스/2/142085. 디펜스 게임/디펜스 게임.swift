import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    
    // 최종 라운드
    var result: Int = -1
     // 남은 병사 수
    var leftArmy: Int = n
    // 남은 무적권 수
    var leftK: Int = k
    
     // 라운드 정보를 힙으로 구성
    var roundInfo: [(army: Int, round: Int)] = []
    
    // 힙 삽입
    func infoPush(input: (army: Int , round: Int)) {
        roundInfo.append(input)
        var myIndex = roundInfo.count-1
        
        // 루트까지 확인
        while myIndex > 0 {
            let parentIndex = (myIndex-1) / 2
            if roundInfo[parentIndex].army <= input.army { // 부모보다 죽은 병사 수가 많음
                roundInfo.swapAt(parentIndex, myIndex)
            } else { // 부모보다 죽은 병사 수가 적으면 끝
                break
            }
            myIndex = parentIndex
        }
    }
    
    // 힙 삭제
    func infoPop() -> (army: Int, round: Int) {
        
        roundInfo.swapAt(0, roundInfo.count-1)
        let result = roundInfo.popLast()!
        var myIndex = 0
        
        while myIndex < roundInfo.count {
            // 자식이 2인 경우
            if (myIndex+1)*2 < roundInfo.count { 
                let leftIndex = (myIndex+1)*2-1
                let rightIndex = (myIndex+1)*2
                
                // 둘다 부모다 큰 경우
                if (roundInfo[myIndex].army < roundInfo[leftIndex].army) &&
                   (roundInfo[myIndex].army < roundInfo[rightIndex].army) 
                { 
                    let childIndex = roundInfo[leftIndex].army > roundInfo[rightIndex].army ? leftIndex : rightIndex
                    roundInfo.swapAt(myIndex, childIndex)
                    myIndex = childIndex    
                } 
                // 왼쪽만 부모보다 큰 경우
                else if roundInfo[myIndex].army < roundInfo[leftIndex].army
                {  
                    roundInfo.swapAt(myIndex, leftIndex)
                    myIndex = leftIndex
                } 
                // 오른쪽만 부모보다 큰 경우
                else if roundInfo[myIndex].army < roundInfo[rightIndex].army 
                {  
                    roundInfo.swapAt(myIndex, rightIndex)
                    myIndex = rightIndex
                } 
                // 둘다 부모랑 같은 경우
                else if (roundInfo[myIndex].army == roundInfo[leftIndex].army) &&
                        (roundInfo[myIndex].army == roundInfo[rightIndex].army) 
                { 
                    let childIndex = roundInfo[leftIndex].round > roundInfo[rightIndex].round ? leftIndex : rightIndex
                    if roundInfo[myIndex].round < roundInfo[childIndex].round {
                        roundInfo.swapAt(myIndex, childIndex)
                        myIndex = childIndex
                    } else {
                        break
                    }
                } 
                // 왼쪽만 부모랑 같은 경우
                else if roundInfo[myIndex].army == roundInfo[leftIndex].army { 
                    if roundInfo[myIndex].round < roundInfo[leftIndex].round {
                        roundInfo.swapAt(myIndex, leftIndex)
                        myIndex = leftIndex
                    } else {
                        break
                    }
                } 
                // 오른쪽만 부모랑 같은 경우
                else if roundInfo[myIndex].army == roundInfo[rightIndex].army { 
                    if roundInfo[myIndex].round < roundInfo[rightIndex].round {
                        roundInfo.swapAt(myIndex, rightIndex)
                        myIndex = rightIndex
                    } else {
                        break
                    }
                } 
                // 둘다 부모보다 작은 경우
                else {
                    break
                }
            }
            // 자식이 1인 경우
            else if (myIndex+1)*2 == roundInfo.count { 
                let childIndex = roundInfo.count-1
                
                if roundInfo[myIndex].army == roundInfo[childIndex].army {
                    if roundInfo[myIndex].round < roundInfo[childIndex].round {
                        roundInfo.swapAt(myIndex, childIndex)
                    } else {
                        break
                    }
                } else if roundInfo[myIndex].army < roundInfo[childIndex].army {
                    roundInfo.swapAt(myIndex, childIndex)
                } else { 
                    break 
                }
                myIndex = childIndex
            } else { // 자식이 0인 경우
                break
            }
        }
        
        return result   
    }
    
    // roundInfo 출력
    func printInsert() {
        for info in roundInfo {
            print(info)
        }
        print("\n\n\n")
    }
    
    for (offset, e) in enemy.enumerated() {
        leftArmy -= e
        infoPush(input: (army: e, round: offset))
        // printInsert()
         
        // 무적권을 써야하는 상황
        if leftArmy < 0 {
            // 무적권 남아있음
            if leftK > 0 {
                //무적권 사용
                leftK -= 1
                // 가장 많이 살릴 수 있는 라운드에 쓰고, 이번 라운드가 포함되면 이번 라운드를 살림
                // roundInfo가 비어있을 수 있나? - 없음, 최소 이번라운드 정보가 들어가기 때문
                let relive = infoPop().army
                leftArmy += relive
                
            } else {
                // 무적권도 없고 라운드도 졌음
                result = offset
                break
            }
        }
    }
    
    return result == -1 ? enemy.count : result
}
