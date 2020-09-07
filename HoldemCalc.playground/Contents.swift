import SwiftUI

// Tie breaker rules: https://www.adda52.com/poker/poker-rules/cash-game-rules/tie-breaker-rules

enum Rank: Int {
    case two = 2
    case three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> Color {
        switch self {
        case .spades, .clubs:
            return Color.black
        case .hearts, .diamonds:
            return Color.red
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
threeOfSpades.suit.color()

func createDeck() -> [Card] {
    var deck = Array<Card>()
    for suit in Suit.allCases {
        for rawRank in 2...14 {
            if let rank = Rank(rawValue: rawRank) {
                deck.append(Card(rank: rank, suit: suit))
            }
        }
    }
    return deck
}

let newDeck = createDeck()
newDeck[0].simpleDescription()
