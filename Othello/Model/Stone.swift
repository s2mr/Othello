enum Stone {
    case empty
    case black
    case white
}

extension Stone {
    var inverse: Stone? {
        switch self {
        case .black:
            return .white

        case .white:
            return .black

        case .empty:
            return nil
        }
    }
}

extension Stone: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .empty:
            return "-"

        case .black:
            return "x"

        case .white:
            return "o"
        }
    }
}
