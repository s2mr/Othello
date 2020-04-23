typealias GameBoard = [[Stone]]

extension GameBoard {
    enum Const {
        static let sideLength = 8
    }

    static let initialState: GameBoard = [
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

extension GameBoard {
    var debugDescription: String {
        map { row in
            row.map { stone in
                stone.debugDescription
            }.joined(separator: " ")
        }.joined(separator: "\n")
    }
}
