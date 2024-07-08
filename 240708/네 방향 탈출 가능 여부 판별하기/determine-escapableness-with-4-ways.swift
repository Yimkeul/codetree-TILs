// // // let input = readLine()!.split {$0 == " "}.map{Int($0)!}
// // // let (n, m) = (input[0], input[1])

// // // var graph = [[Int]]()

// // // for _ in 0 ..< n {
// // //     let input = readLine()!.split {$0 == " "}.map{Int($0)!}
// // //     graph.append(input)
// // // }
// // // print(graph)
// // import Foundation

// // // Directions for moving in the grid
// // let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// // // Function to check if the position is within bounds and not a snake
// // func isValid(_ x: Int, _ y: Int, _ grid: [[Int]], _ visited: [[Bool]]) -> Bool {
// //     return x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && grid[x][y] == 1 && !visited[x][y]
// // }

// // func bfs(_ grid: [[Int]], _ startX: Int, _ startY: Int, _ endX: Int, _ endY: Int) -> Bool {
// //     var queue = [(startX, startY)]
// //     var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
// //     visited[startX][startY] = true
    
// //     while !queue.isEmpty {
// //         let (x, y) = queue.removeFirst()
        
// //         if x == endX && y == endY {
// //             return true
// //         }
        
// //         for (dx, dy) in directions {
// //             let newX = x + dx
// //             let newY = y + dy
            
// //             if isValid(newX, newY, grid, visited) {
// //                 visited[newX][newY] = true
// //                 queue.append((newX, newY))
// //             }
// //         }
// //     }
    
// //     return false
// // }

// // // Reading input
// // let nm = readLine()!.split(separator: " ").map { Int($0)! }
// // let n = nm[0]
// // let m = nm[1]

// // var grid = [[Int]]()
// // for _ in 0..<n {
// //     let row = readLine()!.split(separator: " ").map { Int($0)! }
// //     grid.append(row)
// // }

// // if bfs(grid, 0, 0, n-1, m-1) {
// //     print(1)
// // } else {
// //     print(0)
// // }


// import Foundation

// // Directions for moving in the grid
// let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// // Function to check if the position is within bounds and not a snake
// func isValid(_ x: Int, _ y: Int, _ grid: [[Int]], _ visited: [[Bool]]) -> Bool {
//     return x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && grid[x][y] == 1 && !visited[x][y]
// }

// func bfs(_ grid: [[Int]], _ startX: Int, _ startY: Int) -> Bool {
//     let endX = grid.count - 1
//     let endY = grid[0].count - 1
    
//     var queue = [(startX, startY)]
//     var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
//     visited[startX][startY] = true
    
//     while !queue.isEmpty {
//         let (x, y) = queue.removeFirst()
        
//         if x == endX && y == endY {
//             return true
//         }
        
//         for (dx, dy) in directions {
//             let newX = x + dx
//             let newY = y + dy
            
//             if isValid(newX, newY, grid, visited) {
//                 visited[newX][newY] = true
//                 queue.append((newX, newY))
//             }
//         }
//     }
    
//     return false
// }

// // Reading input
// let nm = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nm[0]
// let m = nm[1]

// var grid = [[Int]]()
// for _ in 0..<n {
//     let row = readLine()!.split(separator: " ").map { Int($0)! }
//     grid.append(row)
// }

// if bfs(grid, 0, 0) {
//     print(1)
// } else {
//     print(0)
// }


// let dist = [(1, 0), (-1, 0), (0, 1), (0, -1)]
//     let NM = readLine()!.split(separator: " ").map { Int($0)! }
//     let (N, M) = (NM[0], NM[1])
//     var grid = [[Int]]()
    

//     for _ in 0 ..< N {
//         let input = readLine()!.split { $0 == " " }.map { Int($0)! }
//         grid.append(input)
//     }

//     if bfs(0, 0, &grid) {
//         print(1)
//     } else {
//         print(0)
//     }
    
    
//     func isVaild(_ x: Int, _ y: Int, _ grid: inout [[Int]] ,_ visited: inout [[Bool]]) -> Bool {
//         return x >= 0 && x < N && y >= 0 && y < M && !visited[x][y] && grid[x][y] == 1
//     }
    
//     func bfs(_ x: Int, _ y : Int, _ grid: inout [[Int]]) -> Bool {
//         var queue = [(x,y)]
//         var visited = Array(repeating: Array(repeating: false, count: M), count: N)
//         visited[x][y] = true
//         while !queue.isEmpty {
//             let (qx,qy) = queue.removeFirst()
//             if qx == N - 1 && qy == M - 1 {
//                 return true
//             }
//             for (dx,dy) in dist {
//                 let nx = qx + dx
//                 let ny = qy + dy
//                 if isVaild(nx, ny, &grid, &visited) {
//                     visited[nx][ny] = true
//                     queue.append((nx, ny))
//                 }
//             }
//         }
//         return false
//     }



    let dist = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M) = (NM[0], NM[1])
    var grid = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    visited[0][0] = true
    var queue = [(0,0)]
    

    for _ in 0 ..< N {
        let input = readLine()!.split { $0 == " " }.map { Int($0)! }
        grid.append(input)
    }

    if bfs2(grid) {
        print(1)
    } else {
        print(0)
    }
    
    
    func isVaild(_ x: Int, _ y: Int, _ grid:  [[Int]] ,_ visited: inout [[Bool]]) -> Bool {
        return x >= 0 && x < N && y >= 0 && y < M && !visited[x][y] && grid[x][y] == 1
    }
    
    func bfs2( _ grid:  [[Int]]) -> Bool {

        while !queue.isEmpty {
            let (qx,qy) = queue.removeFirst()
            if qx == N - 1 && qy == M - 1{
                return true
            }
            for (dx,dy) in dist {
                let nx = qx + dx
                let ny = qy + dy
                if isVaild(nx, ny, grid, &visited) {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
            // print("test : ", queue)
        }
        return false
    }