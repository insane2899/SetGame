//
//  Oval.swift
//  SetGame
//
//  Created by Soumik Sen on 22/12/23.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        let leftTopPoint = CGPoint(x: rect.midX - (rect.midX/3),
                                   y: rect.midY - (rect.midX/3))
        let rightTopPoint = CGPoint(x: rect.midX + (rect.midX/3),
                                    y: rect.midY - (rect.midX/3))
        let rightBottomPoint = CGPoint(x: rect.midX + (rect.midX/3),
                                       y: rect.midY + (rect.midX/3))
        let leftBottomPoint = CGPoint(x: rect.midX - (rect.midX/3),
                                     y: rect.midY + (rect.midX/3))
        var p = Path()
        p.move(to: leftTopPoint)
        p.addLine(to: rightTopPoint)
        p.move(to: rightBottomPoint)
        p.addLine(to: leftBottomPoint)
        p.move(to: leftTopPoint)
        p.move(to: rightTopPoint)
        // Drawing direction of arc matters it seems
        p.addArc(center: CGPoint(x: rect.midX + (rect.midX/3), y: rect.midY),
                 radius: rect.midX/3,
                 startAngle: Angle.degrees(270),
                 endAngle: Angle.degrees(90),
                 clockwise: false)
        p.addArc(center: CGPoint(x: rect.midX - (rect.midX/3), y: rect.midY),
                 radius: rect.midX/3,
                 startAngle: Angle.degrees(90),
                 endAngle: Angle.degrees(270),
                 clockwise: false)
        p.closeSubpath()
        
        return p
    }
}

#Preview {
    Oval()
}
