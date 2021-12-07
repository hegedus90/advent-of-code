import Foundation

extension Collection where Iterator.Element: Comparable {
    
    func median() -> Element {
        sorted(by: <)[count / 2]
    }
    
}
