let nk = readLine()!.split { $0 == " "}.map { Int($0)! }

    var dic = [Int:Int]()

    for _ in 0 ..< nk[0] {
        let input = readLine()!.split { $0 == " "}
        let (num, str) = (Int(input[0])!, String(input[1]))
        dic[num] = (str == "G" ? 1 : 2)
    }
    
    let newDic = dic.sorted{ $0.key < $1.key }
    
    var newAry = [Int](repeating: 0, count: newDic.last!.key + 1)
    
    for (key, value) in newDic {
        newAry[key] = value
    }
    
    var ans = Int.min
    
    for i in 1 ..< newAry.count - nk[1] {
        var temp = 0
        for j in i ... i + nk[1] {
            temp += newAry[j]
        }
        ans = max(temp, ans)
//        print(i)
    }
    
    
    print(ans)
