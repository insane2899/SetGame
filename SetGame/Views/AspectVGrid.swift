//
//  AspectVGrid.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct AspectVGrid<Item, ItemView: View>: View {
    var itemArray: [Item]
    var content: (Item) -> ItemView

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60), spacing: 0)], spacing: 0)  {
            ForEach(itemArray.indices, id: \.self) { index in
                content(itemArray[index])
                    .aspectRatio(SetConstants.aspectRatio, contentMode: .fit)
            }
        }
    }
}
