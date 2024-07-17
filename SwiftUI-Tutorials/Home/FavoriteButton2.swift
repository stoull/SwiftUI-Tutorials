//
//  FavoriteButton2.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/17.
//

import SwiftUI

struct FavoriteButton2: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            isSet ? Label("Unfavorite", systemImage: "heart.fill") : Label("Favorite", systemImage: "heart")
        }
        .tint(isSet ? .yellow : .blue)
    }
}

struct FavoriteButton2_Preview: View {
    @State var isFav: Bool = false
    var body: some View {
        FavoriteButton2(isSet: $isFav)
    }
}

#Preview {
    FavoriteButton2_Preview()
}
