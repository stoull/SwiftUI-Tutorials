//
//  HomeView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShowFavoriteOnly = false
    
    @EnvironmentObject var store: TutorialAppStore
    
    var filterLandmarks: [Landmark] {
        store.landmarks.filter { landmark in
            (!isShowFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $isShowFavoriteOnly, label: {
                    Text("Favoriate Only")
                })
                ForEach(filterLandmarks) { landmark in
                    NavigationLink(destination: DetailView(landmark: landmark)) {
                        HomeRow(landmark: landmark)
                    }
                    .listRowSeparator(.hidden)
                }
                Text("Totoal: \(filterLandmarks.count)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.callout)
            }
            .animation(.default, value: filterLandmarks)
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar() {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: FontExamplesView()) {
                        Text("Fonts")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(TutorialAppStore(landmarks: testLandmarks!))
}
