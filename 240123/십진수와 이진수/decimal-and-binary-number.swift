import Foundation
// let input = Int(readLine()!)! * 17
// let ans = String(input, radix : 2)
// print(ans)

let input = readLine()!
let trans = Int(input, radix: 2)! * 17
let ans = String(trans, radix: 2)
print(ans)