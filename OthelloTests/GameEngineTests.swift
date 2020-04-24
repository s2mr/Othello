import XCTest
@testable import Othello

final class GameBoardTests: XCTestCase {
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

    func testEngine() {
        do {
            let engine = GameEngine(initialGameBoard: .initialState, initialPlayer: .black)
            XCTAssertTrue(engine.canPutStone(at: 2, column: 3))
            XCTAssertTrue(engine.canPutStone(at: 3, column: 2))
            XCTAssertTrue(engine.canPutStone(at: 5, column: 4))
            XCTAssertTrue(engine.canPutStone(at: 4, column: 5))

            XCTAssertFalse(engine.canPutStone(at: 2, column: 4))
            XCTAssertFalse(engine.canPutStone(at: 3, column: 5))
            XCTAssertFalse(engine.canPutStone(at: 4, column: 2))
            XCTAssertFalse(engine.canPutStone(at: 5, column: 3))

            XCTAssertFalse(engine.canPutStone(at: 3, column: 3))
            XCTAssertFalse(engine.canPutStone(at: 3, column: 4))
            XCTAssertFalse(engine.canPutStone(at: 4, column: 3))
            XCTAssertFalse(engine.canPutStone(at: 4, column: 4))
        }

        do {
            let engine = GameEngine(initialGameBoard: .testCase1, initialPlayer: .black)
            XCTAssertTrue(engine.canPutStone(at: 2, column: 2))
        }

        do {
            let engine = GameEngine(initialGameBoard: .testCase1, initialPlayer: .white)
            XCTAssertTrue(engine.canPutStone(at: 5, column: 5))
        }
    }
}

private extension GameBoard {
    static let testCase1: GameBoard = [
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .white, .black, .empty, .empty, .empty],
        [.empty, .empty, .empty, .black, .black, .black, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    ]
}
