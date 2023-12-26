//
//  ContentView.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct SetView: View {
    @Namespace var setCardSpace
    typealias Card = SetModel.Card
    @StateObject var viewModel = SetViewModel()
    private let gameTitle: String = "Game of Set"

    var body: some View {
        VStack(spacing: 0) {
            title
            Divider()
            cards
                .font(.largeTitle)
            Spacer()
            Divider()
            deck
        }
    }

    var deck: some View {
        ZStack {
            ForEach(viewModel.deckCards) { card in
                Cards(content: getCardContent(of: card))
                    .frame(width: 60, height: 80)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                    }
                    .onTapGesture {
                        var delay: TimeInterval = 0.0
                        for _ in 0..<3 {
                            withAnimation(.easeIn(duration: 0.2).delay(delay)) {
                                viewModel.dealACard()
                            }
                            delay += 0.15
                        }
                    }
                    .matchedGeometryEffect(id: card.id, in: setCardSpace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
    }

    var title: some View {
        Text(gameTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
        
    }

    @ViewBuilder
    var cards: some View {
        AspectVGrid(itemArray: viewModel.displayedCards) { card in
            Cards(content: getCardContent(of: card))
                .overlay(Rectangle()
                    .foregroundColor(viewModel.isMatched ? .green : .gray)
                    .opacity(viewModel.cardIsSelected(card) ? 0.5 : 0.0))
                .padding(5)
                .onTapGesture {
                    viewModel.selectCard(card)
                }
                .matchedGeometryEffect(id: card.id, in: setCardSpace)
                .transition(.identity)
        }
    }

    @ViewBuilder
    func getCardContent(of card: Card) -> some View {
        VStack (spacing: 10) {
            ForEach(0 ..< card.count.rawValue) { _ in
                switch card.shape {
                case .diamond:
                    drawCardUsing(shape: Diamond(), shade: card.shade, color: card.color)
                case .oval:
                    drawCardUsing(shape: Oval(), shade: card.shade, color: card.color)
                case .squiggly:
                    drawCardUsing(shape: Squiggle(), shade: card.shade, color: card.color)
                }
            }
        }
    }

    @ViewBuilder
    func drawCardUsing<GivenShape: Shape>(shape: GivenShape, shade: Card.CardShade, color: Card.CardColor) -> some View {
        let colorToUse = viewModel.getColor(color)
        switch shade {
        case .open:
            shape.stroke(colorToUse, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        case .solid:
            shape.fill(colorToUse)
        case .striped:
            StripeView(shape, using: colorToUse)
        }
    }
}

#Preview {
    SetView()
}
