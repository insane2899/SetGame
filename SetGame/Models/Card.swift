//
//  Card.swift
//  SetGame
//
//  Created by Soumik Sen on 20/12/23.
//

import Foundation

extension SetModel {
    struct Card: Equatable, Identifiable {
        var id: Int
        let shape: CardShape
        let count: CardCount
        let shade: CardShade
        let color: CardColor
        enum CardShape: Int, Equatable, CaseIterable {
            case diamond = 1
            case squiggly = 2
            case oval = 3
        }

        enum CardCount: Int, Equatable, CaseIterable {
            case one = 1
            case two = 2
            case three = 3
        }

        enum CardShade: Int, Equatable, CaseIterable {
            case solid = 1
            case striped = 2
            case open = 3
        }

        enum CardColor: Int, Equatable, CaseIterable {
            case red = 1
            case green = 2
            case purple = 3
        }
    }
}
