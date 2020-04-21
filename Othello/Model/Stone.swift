enum Stone {
    case empty
    case black
    case white
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
