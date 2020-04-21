import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    @Published private var gameBoard = GameBoard.initialState
    @Published private(set) var playerName: String = ""

    private var cancellableBag = [AnyCancellable]()

    init() {
        $gameBoard.map(\.player.description)
            .assign(to: \.playerName, on: self)
            .store(in: &cancellableBag)
    }

    func restart() {
        gameBoard = .initialState
    }

    func didSelect(at row: Int, column: Int) {
        guard gameBoard.canPutStone(gameBoard.player.stone, at: row, column: column) else { return }

        gameBoard.stones[row][column] = gameBoard.player.stone
        gameBoard.player.toggle()

        print(row, column)
        print(gameBoard)
    }

    func stone(for row: Int, column: Int) -> Stone {
        gameBoard.stones[row][column]
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
