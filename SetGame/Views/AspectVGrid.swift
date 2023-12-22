//
//  AspectVGrid.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var itemArray: [Item]
    var content: (Item) -> ItemView
    private let aspectRatio: CGFloat = 2/3

    var body: some View {
        GeometryReader { geometry in
            let calculatedMinimum = getMinimumFromGeometry(geometry.size, itemArray.count)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: calculatedMinimum), spacing: 0)], spacing: 0)  {
                ForEach(itemArray) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }

    func getMinimumFromGeometry(_ size: CGSize, _ count: Int) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return max(60, (size.width / columnCount).rounded(.down))
            }
            columnCount += 1.0
        } while columnCount < count
        return 60
    }
}
