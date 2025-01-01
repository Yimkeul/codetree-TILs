let NK = readLine()!.split { $0 == " "}.map { Int($0)! }

var array = [Int](repeating: 0, count: 201)

for _ in 0 ..< NK[0] {
    let input = readLine()!.split { $0 == " "}.map { Int($0)! }
    let candy = input[0]
    let position = input[1]
    array[position] += candy
}
var ans = 0

for i in NK[1] + 1 ..< array.count - NK[1] {
    var temp = 0
    for j in i - NK[1] ... i + NK[1] {
        temp += array[j]
    }
    ans = max(temp, ans)
}
print(ans)
