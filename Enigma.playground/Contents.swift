//: [Previous](@previous)

import Foundation


// ----------------------------------------------------- //

// https://en.wikipedia.org/wiki/Enigma_rotor_details#Rotor_wiring_tables
// Swiss K models
// Reflector A

let I_K: Cipher = { token in
    switch token {
    case .A: return .P
    case .B: return .E
    case .C: return .Z
    case .D: return .U
    case .E: return .O
    case .F: return .H
    case .G: return .X
    case .H: return .S
    case .I: return .C
    case .J: return .V
    case .K: return .F
    case .L: return .M
    case .M: return .T
    case .N: return .B
    case .O: return .G
    case .P: return .L
    case .Q: return .R
    case .R: return .I
    case .S: return .N
    case .T: return .Q
    case .U: return .J
    case .V: return .W
    case .W: return .A
    case .X: return .Y
    case .Y: return .D
    case .Z: return .K
    }
}
let II_K: Cipher = { token in
    switch token {
    case .A: return .Z
    case .B: return .O
    case .C: return .U
    case .D: return .E
    case .E: return .S
    case .F: return .Y
    case .G: return .D
    case .H: return .K
    case .I: return .F
    case .J: return .W
    case .K: return .P
    case .L: return .I
    case .M: return .C
    case .N: return .Q
    case .O: return .X
    case .P: return .H
    case .Q: return .M
    case .R: return .V
    case .S: return .B
    case .T: return .L
    case .U: return .G
    case .V: return .N
    case .W: return .J
    case .X: return .R
    case .Y: return .A
    case .Z: return .T
    }
}
let III_K: Cipher = { token in
    switch token {
    case .A: return .E
    case .B: return .H
    case .C: return .R
    case .D: return .V
    case .E: return .X
    case .F: return .G
    case .G: return .A
    case .H: return .O
    case .I: return .B
    case .J: return .Q
    case .K: return .U
    case .L: return .S
    case .M: return .I
    case .N: return .M
    case .O: return .Z
    case .P: return .F
    case .Q: return .L
    case .R: return .Y
    case .S: return .N
    case .T: return .W
    case .U: return .K
    case .V: return .T
    case .W: return .P
    case .X: return .D
    case .Y: return .J
    case .Z: return .C
    }
}
let UKW_K: Cipher = { token in
    switch token {
    case .A: return .I
    case .B: return .M
    case .C: return .E
    case .D: return .T
    case .E: return .C
    case .F: return .G
    case .G: return .F
    case .H: return .R
    case .I: return .A
    case .J: return .Y
    case .K: return .S
    case .L: return .Q
    case .M: return .B
    case .N: return .Z
    case .O: return .X
    case .P: return .W
    case .Q: return .L
    case .R: return .H
    case .S: return .K
    case .T: return .D
    case .U: return .V
    case .V: return .U
    case .W: return .P
    case .X: return .O
    case .Y: return .J
    case .Z: return .N
    }
}
let ETW_K: Cipher = { token in
    switch token {
    case .A: return .Q
    case .B: return .W
    case .C: return .E
    case .D: return .R
    case .E: return .T
    case .F: return .Z
    case .G: return .U
    case .H: return .I
    case .I: return .O
    case .J: return .A
    case .K: return .S
    case .L: return .D
    case .M: return .F
    case .N: return .G
    case .O: return .H
    case .P: return .J
    case .Q: return .K
    case .R: return .P
    case .S: return .Y
    case .T: return .X
    case .U: return .C
    case .V: return .V
    case .W: return .B
    case .X: return .N
    case .Y: return .M
    case .Z: return .L
    }
}
let swissK = [I_K, II_K, III_K, UKW_K, ETW_K]
let plugboard: Cipher = { token in
    switch token {
    case .A: return .D
    case .B: return .P
    case .C: return .L
    case .D: return .A
    case .E: return .X
    case .H: return .M
    case .J: return .S
    case .K: return .O
    case .L: return .C
    case .M: return .H
    case .N: return .Z
    case .O: return .K
    case .P: return .B
    case .Q: return .Y
    case .S: return .J
    case .U: return .W
    case .W: return .U
    case .X: return .E
    case .Y: return .Q
    case .Z: return .N
    default:
        return token
    }
}

var enigma = Enigma(rotor0: swissK[0], rotor1: swissK[1], rotor2: swissK[2], plugboard: plugboard, key: (.A, .A, .A))
let message = "HELLOWORLD"
let message2 = "AAAAAAAAAA"
let ciphered = enigma.cipher(message)
let ciphered2 = enigma.cipher(message2)

var _enigma = Enigma(rotor0: swissK[0], rotor1: swissK[1], rotor2: swissK[2], plugboard: plugboard, key: (.A, .A, .A))
let deciphered = _enigma.cipher(ciphered)
let deciphered2 = _enigma.cipher(ciphered2)

let test1 = deciphered == message
let test2 = deciphered2 == message2

//: [Next](@next)
