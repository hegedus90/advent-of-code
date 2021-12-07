import Foundation

public class Puzzle7 {
    
    public static func loadInput() -> [Int] {
        ResourceHelper.loadTextFile(named: "input")
            .trimmingCharacters(in: .newlines)
            .split(separator: ",")
            .map(String.init)
            .compactMap(Int.init)
    }
    
    public init() {}
    
    // Part 1
    
    public func solveFirstPart(input: [Int] = loadInput()) -> Int {
        let median = input.median()
        return input
            .map { abs($0 - median) }
            .reduce(0, +)
    }
    
    // Part 2
    
    public func solveSecondPart(input: [Int] = loadInput()) -> Int {
        (input.min()! ... input.max()!)
            .map { position in
                input
                    .map { fuel(from: position, to: $0) }
                    .reduce(0, +)
            }
            .min()!
    }
    
    private func fuel(from: Int, to: Int) -> Int {
        let distance = abs(to - from)
        return (distance * (distance + 1)) / 2
    }
    
}
