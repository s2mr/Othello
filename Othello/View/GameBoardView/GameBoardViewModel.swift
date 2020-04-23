import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    @Published private var gameEngine: GameEngine
    @Published private(set) var playerName: String = ""

    private var cancellableBag = [AnyCancellable]()

    init(gameEngine: GameEngine = GameEngine()) {
        self.gameEngine = gameEngine

        $gameEngine.map(\.currentPlayer.description)
            .assign(to: \.playerName, on: self)
            .store(in: &cancellableBag)
    }

    func restart() {
        gameEngine.resetBoard()
    }

    func didSelect(at row: Int, column: Int) {
        guard gameEngine.canPutStone(at: row, column: column) else { return }
        gameEngine.putStone(at: row, column: column)

        print(row, column)
        print(gameEngine.currentGameBoard.debugDescription)
    }

    func stone(for row: Int, column: Int) -> Stone {
        gameEngine.stone(at: row, column: column)
    }
}
