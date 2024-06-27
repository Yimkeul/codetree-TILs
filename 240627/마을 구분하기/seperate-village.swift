let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var village = 0
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

var peoples:[Int] = []
for i in 0 ..< n {
    let input = readLine()!.split {$0 == " "}.map{Int($0)!}
    graph[i] = input
}
// i == y , j == x
for i in 0 ..< n {
    for j in 0 ..< n {
        if !visited[i][j] && graph[i][j] == 1{
            let people = dfs(j,i)
            village += 1
            peoples.append(people)
        }
    }
}

print(village)
var sorted = peoples.sorted {$0 < $1}
sorted.map { print($0) }




func dfs(_ x:Int, _ y: Int) -> Int {
    if visited[y][x] {
        return 0
    }
    visited[y][x] = true
    var cnt = 1
    for i in 0 ..< 4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if !visited[ny][nx] && graph[ny][nx] == 1 {
                cnt += dfs(nx,ny)
            }
        }
    }
    return cnt
}