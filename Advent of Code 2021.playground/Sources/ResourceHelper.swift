import Foundation

public class ResourceHelper {
    
    public static func loadTextFile(named filename: String) -> String {
        String(
            data: FileManager.default.contents(
                atPath: Bundle.main.path(forResource: filename, ofType: "txt")!
            )!,
            encoding: .utf8
        )!
    }

}
