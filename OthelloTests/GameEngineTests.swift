import XCTest
@testable import Othello

final class GameBoardTests: XCTestCase {
    var gameEngine: GameEngine!

    override func setUp() {
        super.setUp()

        gameEngine = GameEngine(
            initialGameBoard: .initialState,
            initialPlayer: .initialState
        )
    }

    func testGameBoard() throws {
        do {
            let stones: [Stone] = [.black, .white, .empty]
            XCTAssertFalse(stones.canPutStone(at: 0, for: .black))
            XCTAssertFalse(stones.canPutStone(at: 1, for: .black))
            XCTAssertTrue(stones.canPutStone(at: 2, for: .black))
        }

        do {
            let stones: [Stone] = [.black, .white, .white, .empty]
            XCTAssertFalse(stones.canPutStone(at: 0, for: .black))
            XCTAssertFalse(stones.canPutStone(at: 1, for: .black))
            XCTAssertFalse(stones.canPutStone(at: 2, for: .black))
            XCTAssertTrue(stones.canPutStone(at: 3, for: .black))
        }

        do {
            let stones: [Stone] = [.white, .white, .black, .empty]
            XCTAssertFalse(stones.canPutStone(at: 0, for: .white))
            XCTAssertFalse(stones.canPutStone(at: 1, for: .black))
            XCTAssertFalse(stones.canPutStone(at: 2, for: .white))
            XCTAssertTrue(stones.canPutStone(at: 3, for: .white))
            XCTAssertFalse(stones.canPutStone(at: 3, for: .black))
        }
    }
}
