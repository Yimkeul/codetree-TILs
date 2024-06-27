import Foundation

let input = readLine()!.split{$0 == " "}.map {Int($0)!}
let (n, m) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func isValid(_ x: Int, _ y: Int, _ height: Int, _ visited: inout [[Bool]]) -> Bool {
    return x >= 0 && y >= 0 && x < m && y < n && !visited[y][x] && map[y][x] > height
}

func dfs(_ x: Int, _ y: Int, _ height: Int, _ visited: inout [[Bool]]) {
    visited[y][x] = true
    for (dx, dy) in directions {
        let newX = x + dx
        let newY = y + dy
        if isValid(newX, newY, height, &visited) {
            dfs(newX, newY, height, &visited)
        }
    }
}

var maxSafeArea = 0
var minKWithMaxSafeArea = Int.max // 가장 작은 K를 추적하기 위한 변수

for height in 1...100 {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var safeAreaCount = 0

    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] > height && !visited[i][j] {
                dfs(j, i, height, &visited)
                safeAreaCount += 1
            }
        }
    }

    if safeAreaCount > maxSafeArea {
        maxSafeArea = safeAreaCount
        minKWithMaxSafeArea = height // 새로운 최대 안전 영역을 찾았으므로 해당 height가 현재의 최소 K가 됨
    } else if safeAreaCount == maxSafeArea {
        minKWithMaxSafeArea = min(minKWithMaxSafeArea, height) // 같은 경우 더 작은 K를 선택
    }
}

print(minKWithMaxSafeArea, maxSafeArea)