import XCTest
@testable import Othello

final class GameBoardTests: XCTestCase {
    var gameBoard: GameBoard!

    override func setUp() {
        super.setUp()

        gameBoard = .initialState
    }

    func testGameBoard() throws {
        XCTAssertEqual(
            gameBoard.canPutStone(.black, at: .zero, column: .zero),
            false
        )
    }
}
