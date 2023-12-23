//
//  Stripe.swift
//  SetGame
//
//  Created by Soumik Sen on 23/12/23.
//

import SwiftUI

import SwiftUI

struct Stripe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        for x in stride(from: 0, to: width, by: width/9) {
            path.move(to: CGPoint(x: x, y: -width))
            path.addLine(to: CGPoint(x: x, y: width))
        }
        path.closeSubpath()
        return path
    }
}
