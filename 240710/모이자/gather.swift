let n = Int(readLine()!)!
let line = readLine()!.split { $0 == " "}.map {Int($0)!}

var dists = [Int]()

for i in 0 ..< n {
    var sum = 0
    for j in 0 ..< n {
        let dist = abs(i - j)
        sum += line[j] * dist
    }
    dists.append(sum)
}
print(dists.min()!)