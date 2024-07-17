//
//  HomeView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import SwiftUI

struct LandmarkListView: View {
    
    @State var isShowFavoriteOnly = false
    
    @EnvironmentObject var store: AppStore
    
    @State private var landmarkInEditing: Landmark?
    @State private var isDeleting: Bool = false
    
    var currentEditingIndex: Int? {
        guard let landmark = landmarkInEditing else { return nil }
        return store.landmarks.firstIndex(where: { $0.id == landmark.id })
    }
    
    var filterLandmarks: [Landmark] {
        let landmarks = store.filteredLandmarks(searchText: store.searchText)
        return landmarks.filter { landmark in
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
                            landmarkInEditing = landmark
                            isDeleting.toggle()
                        }
                        .tint(.red)
                        FavoriteButton2(isSet:
                                            $store.landmarks.first(where: { $0.id == landmark.id })!.isFavorite
                        )
                    }
                }
                Text("Totoal: \(filterLandmarks.count)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.callout)
            }
            .animation(.default, value: filterLandmarks)
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.automatic)
            .searchable(text: $store.searchText, prompt: "search landmarks")
            .toolbar() {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: FontExamplesView()) {
                        Text("Fonts")
                    }
                }
            }
            .alert("Confirm delete?",
                   isPresented: $isDeleting,
                   presenting: landmarkInEditing) { landmark in
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
        .environmentObject(AppStore(landmarks: testLandmarks!))
}
