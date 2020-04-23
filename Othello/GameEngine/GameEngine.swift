struct GameEngine {
    private(set) var currentGameBoard: GameBoard
    private(set) var currentPlayer: Player

    init(
        initialGameBoard: GameBoard = .initialState,
        initialPlayer: Player = .initialState
    ) {
        currentGameBoard = initialGameBoard
        currentPlayer = initialPlayer
    }

    mutating func resetBoard() {
        currentGameBoard = .initialState
        currentPlayer = .initialState
    }

    func stone(at row: Int, column: Int) -> Stone {
        currentGameBoard[row][column]
    }

    func canPutStone(at row: Int, column: Int) -> Bool {
        true
    }

    mutating func putStone(at row: Int, column: Int) {
        currentGameBoard[row][column] = currentPlayer.stone
        currentPlayer.toggle()
    }
}

private extension Player {
    var stone: Stone {
        switch self {
        case .black:
            return .black

        case .white:
            return .white
        }
    }
}
