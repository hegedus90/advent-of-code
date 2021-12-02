struct Zip3Generator <A: IteratorProtocol, B: IteratorProtocol, C: IteratorProtocol>: IteratorProtocol {

    private var first: A
    private var second: B
    private var third: C

    private var index = 0

    init(_ first: A, _ second: B, _ third: C) {
        self.first = first
        self.second = second
        self.third = third
    }

    mutating func next() -> (A.Element, B.Element, C.Element)? {
        if let first = first.next(), let second = second.next(), let third = third.next() {
            return (first, second, third)
        }
        return nil
    }
    
}

func zip<A: Sequence, B: Sequence, C: Sequence>(_ first: A, _ second: B, _ third: C) -> IteratorSequence<Zip3Generator<A.Iterator, B.Iterator, C.Iterator>> {
    IteratorSequence(Zip3Generator(first.makeIterator(), second.makeIterator(), third.makeIterator()))
}
