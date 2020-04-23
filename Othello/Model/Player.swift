enum Player {
    case black
    case white
}

extension Player {
    static let initialState = Player.black

    mutating func toggle() {
        switch self {
        case .black:
            self = .white

        case .white:
            self = .black
        }
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        switch self {
        case .black:
            return "Black"

        case .white:
            return "White"
        }
    }
}
