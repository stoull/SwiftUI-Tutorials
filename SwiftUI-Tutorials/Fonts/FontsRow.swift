//
//  FontsRow.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/13.
//

import SwiftUI

struct FontsRow: View {
    var font: MyFont
    var body: some View {
        HStack() {
            Text(font.name)
                .font(font.font)
            Spacer()
            Text("Hello你好")
                .font(font.font)
        }
    }
}

#Preview {
    FontsRow(font: MyFont(id: "testId", name: "Test Font", font: .body))
}
