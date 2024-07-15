//
//  RotatedBadgeSymbol.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/15.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 16))
}
