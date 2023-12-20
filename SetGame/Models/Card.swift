//
//  Card.swift
//  SetGame
//
//  Created by Soumik Sen on 20/12/23.
//

import Foundation

extension SetModel {
    struct Card: Equatable {
        let shape: CardShape
        let count: CardCount
        let shade: CardShade
        let color: CardColor
        enum CardShape: Equatable, CaseIterable {
            case diamond
            case squiggly
            case oval
        }

        enum CardCount: Equatable, CaseIterable {
            case one
            case two
            case three
        }

        enum CardShade: Equatable, CaseIterable {
            case solid
            case striped
            case squiggly
        }

        enum CardColor: Equatable, CaseIterable {
            case red
            case green
            case purple
        }
    }
}
