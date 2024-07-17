//
//  FavoriteButton.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/13.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(.yellow)
        }
    }
}

struct FavoriteButton_Preview: View {
    @State var isFav: Bool = false
    var body: some View {
        FavoriteButton(isSet: $isFav)
    }
}

#Preview {
    FavoriteButton_Preview()
}
