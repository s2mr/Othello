extension Array where Element == Stone {
    func canPutStone(at index: Int, for stone: Stone) -> Bool {
        guard
            self[index] == .empty,
            let inverseStone = stone.inverse else { return false }

        var canPutPrevious: Bool {
            guard self[safe: index-1] == inverseStone else { return false }

            var i = index-2
            while i>=0 {
                let target = self[safe: i]
                switch target {
                case stone: return true
                case inverseStone: break
                case .empty: return false
                case nil,
                     .black,
                     .white: return false
                }
                i -= 1
            }
            return false
        }

        var canPutNext: Bool {
            guard self[safe: index+1] == inverseStone else { return false }

            var i = index+2
            while i<count {
                let target = self[safe: i]
                switch target {
                case stone: return true
                case inverseStone: break
                case .empty: return false
                case nil,
                     .black,
                     .white: return false
                }
                i += 1
            }
            return false
        }

        return canPutPrevious || canPutNext
    }
}
