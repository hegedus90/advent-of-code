import Foundation

public class Puzzle2 {
    
    public enum Command {
        case forward(_ amount: Int)
        case up(_ amount: Int)
        case down(_ amount: Int)
    }
    
    public static func loadInput() -> [Command] {
        ResourceHelper.loadTextFile(named: "input")
            .split(separator: "\n")
            .map(String.init)
            .compactMap(convertTextToCommand(text:))
    }
    
    private static func convertTextToCommand(text: String) -> Command? {
        let components = Array(text.split(separator: " "))
        guard components.count == 2, let amount = Int(components[1]) else { return nil }
        switch components[0] {
        case "forward":
            return .forward(amount)
        case "up":
            return .up(amount)
        case "down":
            return .down(amount)
        default:
            return nil
        }
    }
    
    public init() {}
    
    public func solveFirstPart(input: [Command] = loadInput()) -> Int {
        let position = input.reduce((x: 0, y: 0), {
            switch $1 {
            case .forward(let amount):
                return ($0.x + amount, $0.y)
            case .up(let amount):
                return ($0.x, $0.y - amount)
            case .down(let amount):
                return ($0.x, $0.y + amount)
            }
        })
        return position.x * position.y
    }

    public func solveSecondPart(input: [Command]  = loadInput()) -> Int {
        let position = input.reduce((x: 0, y: 0, aim: 0), {
            switch $1 {
            case .forward(let amount):
                return ($0.x + amount, $0.y + amount * $0.aim, $0.aim)
            case .up(let amount):
                return ($0.x, $0.y, $0.aim - amount)
            case .down(let amount):
                return ($0.x, $0.y, $0.aim + amount)
            }
        })
        return position.x * position.y
    }
    
}
