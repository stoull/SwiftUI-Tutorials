//
//  AppStore.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/17.
//

import SwiftUI

enum LandmarkToken: String, Identifiable, Hashable, CaseIterable {
    case favorite
    case featured
    var id: Self { self }
}

class AppStore: ObservableObject {
    @Published var landmarks: [Landmark] = []
    
    // for searching
    @Published var searchText = ""
    @Published var tokens: [LandmarkToken] = []
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    init(landmarks: [Landmark] = []) {
        self.landmarks = landmarks
    }
    
    func filteredLandmarks(searchText: String) -> [Landmark] {
        guard !searchText.isEmpty else { return landmarks }
        return landmarks.filter { landmark in
            landmark.name.lowercased().contains(searchText.lowercased()) ||
            landmark.park.lowercased().contains(searchText.lowercased()) ||
            landmark.state.lowercased().contains(searchText.lowercased())
        }
    }
}

let testStore = AppStore(landmarks: testLandmarks!)
