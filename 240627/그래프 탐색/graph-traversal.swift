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
            dfs(v)
        }
    }
}

for i in 1 ... N {
    if !visited[i] {
        cnt += 1
        dfs(i)
    }
}

// dfs(1)
print(cnt)