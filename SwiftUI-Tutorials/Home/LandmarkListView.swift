//
//  HomeView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import SwiftUI

struct LandmarkListView: View {
    
    @State var isShowFavoriteOnly = false
    
    @EnvironmentObject var store: TutorialAppStore
    
    @State private var landmarkOP: Landmark?
    @State private var isDeleting: Bool = false
    @State private var isSharing: Bool = false
    
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
                        LandmarkRow(landmark: landmark)
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions {
                        Button("Delete", systemImage: "trash") {
                            isDeleting.toggle()
                            landmarkOP = landmark
                        }
                        .tint(.red)
                        Button("Share", systemImage: "square.and.arrow.up") {
                            isSharing.toggle()
                        }
                        .tint(.blue)
                    }
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
            .alert("Confirm delete?",
                   isPresented: $isDeleting,
                   presenting: landmarkOP) { landmark in
                Button(role: .destructive) {
                    // Action for delete
                } label: {
                    Text("Delete \(landmark.name)")
                }
            } message: { landmark in
                if landmark.isFavorite {
                    Text("\(landmark.name) is your favorite landmark")
                } else {
                    Text("\(landmark.name) is not your favorite landmark")
                }
            }
        }
    }
}

#Preview {
    LandmarkListView()
        .environmentObject(TutorialAppStore(landmarks: testLandmarks!))
}
