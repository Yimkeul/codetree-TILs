import Foundation
Q_자동잔기깎이()
func Q_자동잔디깎이() {
    let N = Int(readLine()!)!
    var movements: [(String, Int)] = []
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { String($0) }
        movements.append((input[0], Int(input[1])!))
    }

    let directions: [String: (Int, Int)] = [
        "N": (0, 1),  // 북쪽 이동
        "S": (0, -1), // 남쪽 이동
        "E": (1, 0),  // 동쪽 이동
        "W": (-1, 0)  // 서쪽 이동
    ]

    // 결과 출력
    let result = minimumGrassRegrowCycle(n: N, movements: movements)
    print(result)

    // 함수 정의
    func minimumGrassRegrowCycle(n: Int, movements: [(String, Int)]) -> Int {
        var visitedPositions: [((Int, Int), Int)] = [:] // 위치와 가장 최근 도착 시간을 기록하는 딕셔너리
        var currentPosition = (0, 0) // 시작 위치
        var time = 0 // 시간 초기화
        var minCycle = Int.max // 최소 주기

        // 이동 기록 순회
        for (direction, distance) in movements {
            guard let (dx, dy) = directions[direction] else { continue }

            // 주어진 거리만큼 이동
            for _ in 0..<distance {
                time += 1
                currentPosition = (currentPosition.0 + dx, currentPosition.1 + dy)

                // 해당 위치에 이미 방문한 적이 있는지 확인
                if let lastVisit = visitedPositions[currentPosition] {
                    // 방문 주기 계산
                    let cycle = time - lastVisit
                    minCycle = min(minCycle, cycle)
                }

                // 위치와 현재 시간을 딕셔너리에 기록 (가장 최근 방문 시간 갱신)
                visitedPositions[currentPosition] = time
            }
        }

        // 결과 반환
        return minCycle == Int.max ? -1 : minCycle
    }
}
