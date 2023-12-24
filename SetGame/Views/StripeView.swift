//
//  StripeView.swift
//  SetGame
//
//  Created by Soumik Sen on 23/12/23.
//

import SwiftUI

struct StripeView<Content: Shape>: View {
    let content: Content
    let color: Color

    init(_ content: Content, using color: Color) {
        self.content = content
        self.color = color
    }
    
    var body: some View {
        content
            .stroke(lineWidth: 1)
            .foregroundColor(color)
            .overlay {
                Stripe()
                    .stroke(color, lineWidth: 1)
                    .clipShape(content)
            }
    }
}

#Preview {
    StripeView(Diamond(), using: .blue)
}
