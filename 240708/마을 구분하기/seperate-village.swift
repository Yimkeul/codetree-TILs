// let n = Int(readLine()!)!
// var graph: [[Int]] = Array(repeating: [], count: n)
// var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
// var village = 0
// let dx = [0,1,0,-1]
// let dy = [1,0,-1,0]

// var peoples:[Int] = []
// for i in 0 ..< n {
//     let input = readLine()!.split {$0 == " "}.map{Int($0)!}
//     graph[i] = input
// }
// // i == y , j == x
// for i in 0 ..< n {
//     for j in 0 ..< n {
//         if !visited[i][j] && graph[i][j] == 1{
//             let people = dfs(j,i)
//             village += 1
//             peoples.append(people)
//         }
//     }
// }

// print(village)
// var sorted = peoples.sorted {$0 < $1}
// sorted.map { print($0) }




// func dfs(_ x:Int, _ y: Int) -> Int {
//     if visited[y][x] {
//         return 0
//     }
//     visited[y][x] = true
//     var cnt = 1
//     for i in 0 ..< 4 {
//         let nx = x + dx[i]
//         let ny = y + dy[i]
//         if nx >= 0 && nx < n && ny >= 0 && ny < n {
//             if !visited[ny][nx] && graph[ny][nx] == 1 {
//                 cnt += dfs(nx,ny)
//             }
//         }
//     }
//     return cnt
// }


    let n = Int(readLine()!)!
    var grid = [[Int]]()

    let dist = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var isVisited = Array(repeating: Array(repeating: false, count: n), count: n)

    var town = 0
    var people = [Int]()

    for _ in 0 ..< n {
        let input = readLine()!.split { $0 == " " }.map { Int($0)! }
        grid.append(input)
    }

    for i in 0 ..< grid.count {
        for j in 0 ..< grid[0].count {
            if !isVisited[i][j] && grid[i][j] == 1 {
                let value = dfs(i, j, &grid, &isVisited)
                town += 1
                people.append(value)
            }
        }
    }
    print(town)
    let sorted = people.sorted(by: <)
    _ = sorted.map { print($0) }



    func dfs(_ x: Int, _ y: Int, _ grid: inout [[Int]], _ isVisited: inout [[Bool]]) -> Int {
        if isVisited[x][y] {
            return 0
        }
        isVisited[x][y] = true
        var cnt = 1

        for i in 0 ..< 4 {
            let nx = x + dist[i].0
            let ny = y + dist[i].1
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if !isVisited[nx][ny] && grid[nx][ny] == 1 {
                    cnt += dfs(nx, ny, &grid, &isVisited)
                }
            }
        }

        return cnt
    }