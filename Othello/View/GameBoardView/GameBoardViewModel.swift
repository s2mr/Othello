import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    @Published private var gameBoard = GameBoard()

    func didSelect(at row: Int, column: Int) {
        print(row, column)
    }

    func stone(for row: Int, column: Int) -> Stone {
        gameBoard.stones[row][column]
    }
}
