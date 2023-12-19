//
//  ContentView.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct SetView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                title
                Divider()
                cards
            }
        }
    }

    var title: some View {
        Text(SetConstants.gameTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
        
    }

    @ViewBuilder
    var cards: some View {
        let cardsArray: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        AspectVGrid(itemArray: cardsArray) { card in
            Cards()
                .padding(5)
                .onTapGesture {
                    // TODO: Implement Tap
                }
        }
    }
}

#Preview {
    SetView()
}
