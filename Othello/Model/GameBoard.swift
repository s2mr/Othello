struct GameBoard {
    enum Const {
        static let sideLength = 8
    }

    var player: Player = .black

    var stones: [[Stone]] = [
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .white, .black, .empty, .empty, .empty],
        [.empty, .empty, .empty, .black, .white, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    ]
}

extension GameBoard: CustomDebugStringConvertible {
    var debugDescription: String {
        let stoneDescription = stones.map { row in
            row.map { stone in
                stone.debugDescription
            }.joined(separator: " ")
        }.joined(separator: "\n")

        return """
        player: \(player)
        stones:
        \(stoneDescription)
        """
    }
}
