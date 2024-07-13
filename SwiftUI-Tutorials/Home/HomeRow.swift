//
//  HomeCell.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI

struct HomeRow: View {
    var landmark: Landmark
    var body: some View {
        HStack(spacing: 12.0) {
            landmark.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .shadow(radius: 6.0)
            VStack(alignment: .leading, spacing: 6.0) {
                Text(landmark.name)
                    .font(.headline)
                Text(landmark.park)
                    .font(.caption)
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    HomeRow(landmark: testLandmarks!.last!)
}
