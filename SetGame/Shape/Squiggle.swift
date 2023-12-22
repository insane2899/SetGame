//
//  Squiggle.swift
//  SetGame
//
//  Created by Soumik Sen on 22/12/23.
//

import SwiftUI

struct Squiggle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var p = Path()
//        let leftPoint = CGPoint(x: rect.midX - 2*(rect.midX/3) - 20,
//                                 y: rect.midY)
//        let rightPoint = CGPoint(x: rect.midX + (2*(rect.midX/3) + 20),
//                                     y: rect.midY)
//        let center1 = CGPoint(x: rect.midX + 20, y: rect.midY)
//        let center2 = CGPoint(x: rect.midX - 20, y: rect.midY)
//        p.move(to: leftPoint)
//        p.addQuadCurve(to: center1, control: CGPoint(x: rect.midX - (rect.midX/3),
//                                                    y: rect.midY - rect.midY/2))
//        p.move(to: center2)
//        p.addQuadCurve(to: rightPoint, control: CGPoint(x: rect.midX + (rect.midX/3),
//                                                        y:rect.midY + rect.midY/2))
//        
//        return p
//    }
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let leftTopPoint = CGPoint(x: rect.midX - (rect.midX/3),
                                   y: rect.midY - (rect.midX/3))
        let rightTopPoint = CGPoint(x: rect.midX + (rect.midX/3),
                                    y: rect.midY - (rect.midX/3))
        let rightBottomPoint = CGPoint(x: rect.midX + (rect.midX/3),
                                       y: rect.midY + (rect.midX/3))
        let leftBottomPoint = CGPoint(x: rect.midX - (rect.midX/3),
                                     y: rect.midY + (rect.midX/3))
        p.move(to: leftTopPoint)
        p.addLine(to: rightTopPoint)
        p.addLine(to: rightBottomPoint)
        p.addLine(to: leftBottomPoint)
        p.addLine(to: leftTopPoint)
        return p
    }
    
}

#Preview {
    Squiggle()
}
