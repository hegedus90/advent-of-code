import Foundation

public class Puzzle1 {
    
    public static func loadInput() -> [Int] {
        ResourceHelper.loadTextFile(named: "input")
            .split(separator: "\n")
            .map { Int($0)! }
    }
    
    public init() {}
    
    public func solveFirstPart(input: [Int] = loadInput()) -> Int {
        zip(input, input.dropFirst())
            .filter { $0 < $1 }
            .count
    }
    
    public func solveSecondPart(input: [Int] = loadInput()) -> Int {
        solveFirstPart(input:
            zip(input, input.dropFirst(), input.dropFirst(2))
               .map { $0 + $1 + $2 }
        )
    }
    
}
