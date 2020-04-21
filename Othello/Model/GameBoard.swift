struct GameBoard {
    enum Const {
        static let sideLength = 8
    }

    var player: Player
    var stones: [[Stone]]
}

extension GameBoard {
    static let initialState = GameBoard(
        player: .black,
        stones: [
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .white, .black, .empty, .empty, .empty],
            [.empty, .empty, .empty, .black, .white, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
        ]
    )

    func canPutStone(_ stone: Stone, at row: Int, column: Int) -> Bool {
        true
    }
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
