//
//  Diamond.swift
//  SetGame
//
//  Created by Soumik Sen on 22/12/23.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let leftPoint = CGPoint(x: rect.midX/2,
                                y: rect.midY)
        let topPoint = CGPoint(x: rect.midX,
                               y: rect.midY - (rect.midX/3))
        let rightPoint = CGPoint(x: rect.midX * 1.5,
                                 y: rect.midY)
        let bottomPoint = CGPoint(x: rect.midX,
                                  y: rect.midY + (rect.midX/3))
        var p = Path()
        p.move(to: leftPoint)
        p.addLine(to: topPoint)
        p.addLine(to: rightPoint)
        p.addLine(to: bottomPoint)
        p.addLine(to: leftPoint)
        return p
    }
}

#Preview {
    Diamond()
}
