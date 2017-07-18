import Foundation

public struct RotorBox {
    
    public struct Rotor {
        
        let forward: Cipher
        let backward: Cipher
        var position: Token
        
        init(_ forward: @escaping Cipher, position: Token) {
            self.forward = forward
            self.backward = { token in
                let tokens: [Token] = [.A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R, .S, .T, .U, .V, .W, .X, .Y, .Z]
                return tokens.filter{ forward($0) == token }.first!
            }
            self.position = position
        }
        
        mutating func rotate() {
            position = position.next()
        }
    }
    
    private var pure = Rotor({ $0 }, position: .A)
    private var rotor0: Rotor
    private var rotor1: Rotor
    private var rotor2: Rotor
    private let reflector = Rotor({ token in
        switch token {
        case .A: return .E
        case .B: return .J
        case .C: return .M
        case .D: return .Z
        case .E: return .A
        case .F: return .L
        case .G: return .Y
        case .H: return .X
        case .I: return .V
        case .J: return .B
        case .K: return .W
        case .L: return .F
        case .M: return .C
        case .N: return .R
        case .O: return .Q
        case .P: return .U
        case .Q: return .O
        case .R: return .N
        case .S: return .T
        case .T: return .S
        case .U: return .P
        case .V: return .I
        case .W: return .K
        case .X: return .H
        case .Y: return .G
        case .Z: return .D
        }
    }, position: .A) // regard the position of the reflector as .A
    
    private var mod1 = 0
    private var mod2 = 0
    
    public init(rotor0: Rotor, rotor1: Rotor, rotor2: Rotor) {
        self.rotor0 = rotor0
        self.rotor1 = rotor1
        self.rotor2 = rotor2
    }
    
    public mutating func cipher(_ target: Token) -> Token {
        defer {
            rotate()
        }
        
        let input = connect(pure, rotor0)(target)
        let r0 = rotor0.forward(input)
        let _r0 = connect(rotor0, rotor1)(r0)
        let r1 = rotor1.forward(_r0)
        let _r1 = connect(rotor1, rotor2)(r1)
        let r2 = rotor2.forward(_r1)
        let _r2 = connect(rotor2, reflector)(r2)
        let ref = reflector.forward(_r2)
        let _ref = connect(reflector, rotor2)(ref)
        let r2ret = rotor2.backward(_ref)
        let _r2ret = connect(rotor2, rotor1)(r2ret)
        let r1ret = rotor1.backward(_r2ret)
        let _r1ret = connect(rotor1, rotor0)(r1ret)
        let r0ret = rotor0.backward(_r1ret)
        let output = connect(rotor0, pure)(r0ret)
        
        return output
    }
    
    private mutating func rotate() {
        mod1 = (mod1 + 1) % 26
        mod2 = (mod2 + 1) % (26 * 26)
        rotor0.rotate()
        if mod1 == 0 {
            rotor1.rotate()
        }
        if mod2 == 0 {
            rotor2.rotate()
        }
    }
    
    private func connect(_ input: Rotor, _ output: Rotor) -> (Token) -> Token {
        let gap = input.position - output.position
        return { token in
            return token - gap
        }
    }
}
