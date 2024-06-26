let dx = [0, 1]
let dy = [1, 0]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (input[0], input[1])

var matrix = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0..<n {
    let row = readLine()!.split { $0 == " " }.map { Int($0)! }
    matrix.append(row)
}

func dfs(_ x: Int, _ y: Int) {
    visited[x][y] = true // 방문 처리

    for i in 0..<2 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if 0 <= nx && nx < n && 0 <= ny && ny < m { // 올바른 범위인지 확인
            if !visited[nx][ny] && matrix[nx][ny] == 1 { // 방문하지 않았고 뱀이 없는 칸인지 확인
                dfs(nx, ny)
            }
        }
    }
}

dfs(0, 0)

print(visited[n-1][m-1] ? 1 : 0)