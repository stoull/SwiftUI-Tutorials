//
//  DetailView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI

struct DetailView: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 200)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            .padding()
            
            Divider()
            Text(landmark.description)
                .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    DetailView(landmark: testLandmarks!.last!)
}
