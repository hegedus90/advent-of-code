import Foundation

public class Puzzle6 {
    
    public static func loadInput() -> [Int] {
        ResourceHelper.loadTextFile(named: "input")
            .trimmingCharacters(in: .newlines)
            .split(separator: ",")
            .map(String.init)
            .compactMap(Int.init)
    }
    
    public init() {}
    
    // Part 1
    
    private func numberOfFishes(parentFishAge: Int, remainingDays: Int) -> Int {
        parentFishAge < remainingDays
            ? numberOfFishes(parentFishAge: 8, remainingDays: remainingDays - parentFishAge - 1) + numberOfFishes(parentFishAge: 6, remainingDays: remainingDays - parentFishAge - 1)
            : 1
    }
    
    public func solveFirstPart(input: [Int] = loadInput()) -> Int {
        input
            .map { numberOfFishes(parentFishAge: $0, remainingDays: 80) }
            .reduce(0, +)
    }
    
    // Part 2

    public func solveSecondPart(input: [Int]  = loadInput()) -> Int {
        var array = Array(repeating: 0, count: 9)
        input.forEach {
            array[$0] += 1
        }
        
        256.times {
            array.rotateLeft()
            array[6] += array[8]
        }
        
        return array.reduce(0, +)
    }
    
}
