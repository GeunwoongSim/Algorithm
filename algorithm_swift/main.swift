import Foundation

//print(solution())
//print(solution("I"))


let root: Node = Node(value: 10)
root.addNode(20)
root.addNode(5)
root.addNode(21)
root.addNode(8)
root.addNode(4)

//Node.inOrderTraversal(root)
//Node.preOrderTraversal(root)
//Node.postOrderTraversal(root)

//print(root.search(1)?.value)
//print(root.search(4)?.value)

root.leftNode?.deleteNode()
Node.inOrderTraversal(root)
print("=======")

root.rightNode?.deleteNode()
Node.inOrderTraversal(root)

