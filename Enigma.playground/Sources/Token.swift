import Foundation

public enum Token: Character {
    case A = "A", B = "B", C = "C", D = "D", E = "E", F = "F"
    case G = "G", H = "H", I = "I", J = "J", K = "K", L = "L"
    case M = "M", N = "N", O = "O", P = "P", Q = "Q", R = "R"
    case S = "S", T = "T", U = "U", V = "V", W = "W", X = "X"
    case Y = "Y", Z = "Z"
}

extension Token {
    func next() -> Token {
        switch self {
        case .A: return .B
        case .B: return .C
        case .C: return .D
        case .D: return .E
        case .E: return .F
        case .F: return .G
        case .G: return .H
        case .H: return .I
        case .I: return .J
        case .J: return .K
        case .K: return .L
        case .L: return .M
        case .M: return .N
        case .N: return .O
        case .O: return .P
        case .P: return .Q
        case .Q: return .R
        case .R: return .S
        case .S: return .T
        case .T: return .U
        case .U: return .V
        case .V: return .W
        case .W: return .X
        case .X: return .Y
        case .Y: return .Z
        case .Z: return .A
        }
    }
}
extension Token {
    var num: Int {
        switch self {
        case .A: return 0
        case .B: return 1
        case .C: return 2
        case .D: return 3
        case .E: return 4
        case .F: return 5
        case .G: return 6
        case .H: return 7
        case .I: return 8
        case .J: return 9
        case .K: return 10
        case .L: return 11
        case .M: return 12
        case .N: return 13
        case .O: return 14
        case .P: return 15
        case .Q: return 16
        case .R: return 17
        case .S: return 18
        case .T: return 19
        case .U: return 20
        case .V: return 21
        case .W: return 22
        case .X: return 23
        case .Y: return 24
        case .Z: return 25
        }
    }
}
extension Int {
    var token: Token {
        switch self {
        case 0: return .A
        case 1: return .B
        case 2: return .C
        case 3: return .D
        case 4: return .E
        case 5: return .F
        case 6: return .G
        case 7: return .H
        case 8: return .I
        case 9: return .J
        case 10: return .K
        case 11: return .L
        case 12: return .M
        case 13: return .N
        case 14: return .O
        case 15: return .P
        case 16: return .Q
        case 17: return .R
        case 18: return .S
        case 19: return .T
        case 20: return .U
        case 21: return .V
        case 22: return .W
        case 23: return .X
        case 24: return .Y
        case 25: return .Z
        default:
            fatalError()
        }
    }
}

extension Token {
    static func - (lhs: Token, rhs: Int) -> Token {
        return ((lhs.num - rhs + 26) % 26).token
    }
    static func - (lhs: Token, rhs: Token) -> Int {
        return lhs.num - rhs.num
    }
}
