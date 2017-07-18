import Foundation

public struct Enigma {
    
    private var rotorBox: RotorBox
    private let plugboard: Cipher
    
    public typealias Key = (Token, Token, Token)
    public init(rotor0: @escaping Cipher, rotor1: @escaping Cipher, rotor2: @escaping Cipher, plugboard: @escaping Cipher, key: Key) {
        self.rotorBox = RotorBox(
            rotor0: RotorBox.Rotor(rotor0, position: key.0),
            rotor1: RotorBox.Rotor(rotor1, position: key.1),
            rotor2: RotorBox.Rotor(rotor2, position: key.2)
        )
        self.plugboard = plugboard
    }
    
    public mutating func cipher(_ target: Token) -> Token {
        return plugboard(rotorBox.cipher(plugboard(target)))
    }
    
    public mutating func cipher(_ target: String) -> String {
        var output = ""
        for char in target.characters {
            output += String(cipher(Token(rawValue: char)!).rawValue)
        }
        return output
    }
}
