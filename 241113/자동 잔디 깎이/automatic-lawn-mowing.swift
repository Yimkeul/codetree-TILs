import Foundation

// 좌표와 시간을 담은 노드 클래스 (잔디 깎이가 지나간 정보를 저장)
class Node {
    var x: Int
    var y: Int
    var time: Int

    init(x: Int, y: Int, time: Int) {
        self.x = x
        self.y = y
        self.time = time
    }
}

func main() {
    let n = Int(readLine()!)!
    var nodeList: [Node] = [] // 잔디 좌표와 시간을 담을 리스트
    var x = 0
    var y = 0
    var time = 0
    var result = Int.max // 결과를 담을 변수

    // 입력 받기
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        let direction = String(input[0]) // 방향
        let distance = Int(input[1])! // 거리

        // 방향에 따른 이동 좌표와 시간을 가진 노드 생성 후 리스트에 담기
        for _ in 0..<distance {
            time += 1

            switch direction {
            case "E":
                x += 1
            case "W":
                x -= 1
            case "S":
                y -= 1
            case "N":
                y += 1
            default:
                continue
            }
            nodeList.append(Node(x: x, y: y, time: time))
        }
    }

    // nodeList 순회
    for j in 0..<nodeList.count {
        let currentNode = nodeList[j]

        // 현재 노드와 같은 위치에 있는 노드 찾기
        for k in (j + 1)..<nodeList.count {
            let tempNode = nodeList[k]
            if currentNode.x == tempNode.x && currentNode.y == tempNode.y {
                // 방문 주기 계산
                result = min(result, abs(currentNode.time - tempNode.time))
            }
        }
    }

    // 같은 위치에 있는 노드가 존재하지 않는 경우
    if result == Int.max {
        result = -1
    }

    print(result)
}

main()
