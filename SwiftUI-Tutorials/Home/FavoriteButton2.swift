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
            isSet ? Label("Favorite", systemImage: "heart.fill") : Label("Favorite", systemImage: "heart")
        }
        .tint(isSet ? .yellow : .blue)
    }
}

#Preview {
    FavoriteButton2(isSet: .constant(true))
}
