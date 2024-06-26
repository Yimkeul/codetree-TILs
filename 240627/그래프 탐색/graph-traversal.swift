let input = readLine()!.split {$0 == " "}.map {Int($0)!}
let (N, M) = (input[0], input[1])

var graph:[[Int]] = Array(repeating:[] , count: N + 1)
var visited:[Bool] = Array(repeating:false , count: N + 1)
var cnt = 0

for _ in 0 ..< M {
    let input = readLine()!.split {$0 == " "}.map {Int($0)!}
    let (x,y) = (input[0], input[1])
    graph[x].append(y)
    graph[y].append(x)
}

func dfs(_ n:Int) {
    visited[n] = true
    for v in graph[n] {
        if !visited[v] {
            cnt += 1
            dfs(v)
        }
    }
}



dfs(1)
print(cnt)