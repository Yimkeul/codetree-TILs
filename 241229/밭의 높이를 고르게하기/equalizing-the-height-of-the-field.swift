import Foundation

let NHT = readLine()!.split { $0 == " "}.map { Int($0)! }
let input = readLine()!.split { $0 == " "}.map { Int($0)! }

var ans = Int.max


for i in 0 ... input.count - NHT[2] {
    var temp = 0
    for j in i ..< i + NHT[2] {
        temp += abs(input[j] - NHT[1])
    }
    ans = min(ans, temp)
    
}
print(ans)