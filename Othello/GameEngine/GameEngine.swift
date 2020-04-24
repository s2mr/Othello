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
        guard currentGameBoard[row][column] == .empty else { return false }

        let currentPlayerStone = currentPlayer.stone
        let rowLine = currentGameBoard.row(at: row)
        let columnLine = currentGameBoard.column(at: column)
        let (diagonalLine1, diagonalLine2) = currentGameBoard.diagonal(at: row, column: column)

        return rowLine.canPutStone(at: column, for: currentPlayerStone)
            || columnLine.canPutStone(at: row, for: currentPlayerStone)
    }

    mutating func putStone(at row: Int, column: Int) {
        currentGameBoard[row][column] = currentPlayer.stone
        currentPlayer.toggle()
    }
}

private extension GameBoard {
    func row(at row: Int) -> [Stone] {
        self[row]
    }

    func column(at column: Int) -> [Stone] {
        map { row in
            row[column]
        }
    }

    /// 斜め
    func diagonal(at row: Int, column: Int) -> ([Stone], [Stone]) {
        var diagonal1: [Stone] {
            // row, column それぞれから0になるまで1を引いていく
            // どちらかが<countになるまで１増加して値をtakeする --> answer1
            var (row, column) = (row, column)
            while row - 1 >= .zero && column - 1 >= .zero {
                row -= 1
                column -= 1
            }

            var diagonal = [Stone]()
            while row < count && column < self[row].count {
                diagonal.append(self[row][column])
                row += 1
                column += 1
            }
            return diagonal
        }

        var diagonal2: [Stone] {
            // row には +1, columnには -1していって、rowはcount, columnは0になったらストップ
            // rowは-1, columnには+1して値をtakeして、rowが0, columnがcountになったらストップ
            var (row, column) = (row, column)
            while row+1 < count && column-1 > .zero {
                row += 1
                column -= 1
            }

            var diagonal = [Stone]()
            while row >= .zero && column < self[row].count {
                diagonal.append(self[row][column])
                row -= 1
                column += 1
            }
            return diagonal
        }

        return (diagonal1, diagonal2)
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
