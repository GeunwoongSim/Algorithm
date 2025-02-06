//
//  BinarySearchTree.swift
//  algorithm_swift
//
//  Created by 심근웅 on 2/6/25.
//

import Foundation


public class Node<T:Comparable> {
    var value: T // 노드 값
    var parent: Node? // 부모 노드 - 루트 노드는 부모가 없음
    var leftNode: Node? // 왼쪽 자식 노드
    var rightNode: Node? // 오른쪽 자식 노드
    
    // 이러면 초기화 할때 변수를 전부 넣어줘야함, 기본값 지정
    init(value: T, parent: Node? = nil, leftNode: Node? = nil, rightNode: Node? = nil) {
        self.value = value
        self.parent = parent
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    func isRoot() -> Bool { // 루트 노드 인지 판단
        if self.parent == nil { return true }
        return false
    }
    func addNode(_ value: T){ // 노드 삽입
        if value < self.value { // 왼쪽 자식에 삽입
            if let leftNode = self.leftNode { // 왼쪽 자식이 존재 - 삽입을 왼쪽 노드 로 위임
                leftNode.addNode(value)
            }else { // 왼쪽 자식이 미존재 - 새로운 노드를 만들어서 노드 추가
                let newNode: Node = Node(value: value)
                newNode.parent = self
                leftNode = newNode
            }
        }else { // 오른쪽 자식에 삽입
            if let rightNode = self.rightNode {
                rightNode.addNode(value)
            }else { //새로운 노드 추가
                let newNode: Node = Node(value: value)
                newNode.parent = self
                rightNode = newNode
            }
        }
    }
    func search(_ value: T) -> Node? { // 노드 검색
        if value == self.value { return self }
        
        if value < self.value {
            return self.leftNode?.search(value)
        }else {
            return self.rightNode?.search(value)
        }
    }
    func deleteNode(){
        if let _ = self.leftNode, let _ = self.rightNode { // 자식이 두개인 경우
            self.swapNode()
        }else if let left = self.leftNode { // 자식이 왼쪽만 있는 경우
            self.changeParent(left)
        }else if let right = self.rightNode { // 자식이 오른쪽만 있는 경우
            self.changeParent(right)
        }else { // 자식이 없는 경우
            self.changeParent(nil) // 부모의 자식이 nil이면 되는데 왼쪽인지 오른쪽인지 모르니 위임
        }
        //참조값 삭제
        self.parent = nil
        self.leftNode = nil
        self.rightNode = nil
    }
    func changeParent(_ node: Node?) { // 노드의 부모를 변경
        guard let parent = self.parent else { // root 노드인 경우
            node?.parent = nil
            return
        }
        // 객체간의 비교이므로 ===
        if parent.leftNode === self { parent.leftNode = node }
        else { parent.rightNode = node }
        node?.parent = parent // 부모를 변경
    }
    func swapNode() { // 본인과 왼쪽 서브 트리의 가장 오른쪽 노드와 변경, 자식이 둘인 경우에 필요
        // 교환할 노드와 자식들을 연결
        guard let leftNode = self.leftNode, let rightNode = self.rightNode else { return }
        let leftMax: Node = leftNode.searchMax() // 왼쪽 서브 트리중 가장 큰노드
        leftMax.deleteNode() // delete해도 leftMax가 반환되는것은 아님 자식이 있으면 자식과 부모를 연결하고 자식이 없으면 부모와의 연결을 끊을뿐
        leftMax.rightNode = rightNode // 오른쪽 자식을 연결
        rightNode.parent = leftMax //부모 연결
        
        if leftNode === leftMax { // 왼쪽 노드가 왼쪽 자식 뿐일때
            leftMax.leftNode = nil // 변경후의 왼쪽 노드는 없음
        } else { // 변경후에도 노드가 있다면
            leftMax.leftNode = leftNode //왼쪽 자식을 연결
            leftNode.parent = leftMax // 부모 연결
        }
        // 여기까지 교환할 노드와 자식들을 연결
        self.changeParent(leftMax) // 마지막으로 자신의 부모랑 변경한 노드랑 연결
    }
}
// 순회관련 확장
extension Node {
    static func inOrderTraversal(_ node: Node?) { // 중위순회
        guard let node = node else { return }
        inOrderTraversal(node.leftNode)
        print(node.value)
        inOrderTraversal(node.rightNode)
    }
    static func preOrderTraversal(_ node: Node?) { // 전위순회
        guard let node = node else { return }
        print(node.value)
        preOrderTraversal(node.leftNode)
        preOrderTraversal(node.rightNode)
    }
    static func postOrderTraversal(_ node: Node?) { // 후위순회
        guard let node = node else { return }
        postOrderTraversal(node.leftNode)
        postOrderTraversal(node.rightNode)
        print(node.value)
    }
}

extension Node { // 추가 메서드
    func searchMax() -> Node { // 노드보다 가장 큰 값을 서치
        if let rightNode = self.rightNode { // 오른쪽노드가 있음
            return rightNode.searchMax() // 오른쪽 노드의 가장 큰 값을 서치
        }
        return self // 오른쪽 노드가 없으면 내가 가장 큰값
    }
    
}
