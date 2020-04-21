struct GameBoard {
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

enum Stone {
    case empty
    case black
    case white
}

extension Stone: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .empty:
            return "-"

        case .black:
            return "x"

        case .white:
            return "o"
        }
    }
}
