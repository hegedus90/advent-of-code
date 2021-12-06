extension RangeReplaceableCollection {
    
    mutating func rotateLeft(positions: Int = 1) {
        let index = self.index(startIndex, offsetBy: positions, limitedBy: endIndex) ?? endIndex
        let slice = self[..<index]
        removeSubrange(..<index)
        insert(contentsOf: slice, at: endIndex)
    }
    
}
