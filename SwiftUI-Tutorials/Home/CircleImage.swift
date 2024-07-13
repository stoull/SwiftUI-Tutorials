//
//  CircleImage.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7.0)
    }
}

#Preview {
    CircleImage(image: testLandmarks!.last!.image)
}
