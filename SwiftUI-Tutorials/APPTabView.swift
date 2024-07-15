//
//  APPTabView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/15.
//

import SwiftUI

struct APPTabView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.featured)
            LandmarkListView()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
        }
    }
}

#Preview {
    APPTabView()
        .environmentObject(TutorialAppStore(landmarks: testLandmarks!))
}
