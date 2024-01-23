import Foundation


let input = readLine()!
if let trans = Int(input, radix: 2) {
    let ans = String(trans * 17 , radix: 2)
    print(ans)
}
// let ans = String(trans, radix: 2)