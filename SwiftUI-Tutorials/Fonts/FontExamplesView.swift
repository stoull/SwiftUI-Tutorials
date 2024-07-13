//
//  FontExamplesView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/13.
//

import SwiftUI

struct FontExamplesView: View {
    
    @State var fonts: [MyFont] = [
        MyFont(id: "largeTitle", name: "largeTitle", font: .largeTitle),
        MyFont(id: "title", name: "title", font: .title),
        MyFont(id: "title2-14", name: "title2-(iOS14)", font: .title2),
        MyFont(id: "title3-14", name: "title3-(iOS14)", font: .title3),
        MyFont(id: "headline", name: "headline", font: .headline),
        MyFont(id: "subheadline", name: "subheadline", font: .subheadline),
        MyFont(id: "body", name: "body", font: .body),
        MyFont(id: "callout", name: "callout", font: .callout),
        MyFont(id: "footnote", name: "footnote", font: .footnote),
        MyFont(id: "caption", name: "caption", font: .caption),
        MyFont(id: "caption2-14", name: "caption2-(iOS14)", font: .caption2),
    ]
    
    var body: some View {
        List {
            Text("Below are different fonts show with the default size: ")
                .font(.callout)
                .foregroundStyle(.gray)
            ForEach(fonts.reversed()) { font in
                NavigationLink(destination: FontDetailView(font: font)) {
                    FontsRow(font: font)
                }
            }
        }
        .navigationTitle("Examples for Fonts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        FontExamplesView()
    }
}
