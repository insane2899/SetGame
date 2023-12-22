//
//  Cards.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct Cards<Content: View>: View {
    var content: Content
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 2)
            content
                .aspectRatio(1, contentMode: .fit)
        }
    }
}
