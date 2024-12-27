import Foundation

let input = readLine()!.split { $0 == " "}.map { Int($0)! }
let N  = input[0]
let S = input[1]
let input2 = readLine()!.split { $0 == " "}.map { Int($0)! }

let arysum = input2.reduce(0,+)
var ans = Int.max

for i in 0 ..< input2.count {
    for j in i + 1 ..< input2.count {
        var temp = arysum - input2[i] - input2[j]
        var diff = abs(temp - S)
        ans = min(ans, diff)
    }
    
}

print(ans)