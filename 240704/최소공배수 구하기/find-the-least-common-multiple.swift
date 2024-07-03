let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var (a, b) = n >= m ? (n, m) : (m, n)

func gcd(_ a: inout Int, _ b: inout Int) -> Int {
    var r = 0
    while b != 0 {
        r = a % b
        a = b
        b = r
    }
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    return (a * b) / gcd(&a, &b)
}

print(lcm(a, b))