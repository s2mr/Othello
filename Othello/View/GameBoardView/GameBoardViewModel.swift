import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    @Published private var gameBoard = GameBoard()
    @Published private(set) var playerName: String = ""

    private var cancellableBag = [AnyCancellable]()

    init() {
        $gameBoard.map(\.player.description)
            .assign(to: \.playerName, on: self)
            .store(in: &cancellableBag)
    }

    func didSelect(at row: Int, column: Int) {
        gameBoard.player.toggle()
        print(row, column)
        print(gameBoard)
    }

    func stone(for row: Int, column: Int) -> Stone {
        gameBoard.stones[row][column]
    }
}
