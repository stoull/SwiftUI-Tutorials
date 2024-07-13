//
//  SwiftUI_TutorialsApp.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import SwiftUI

@main
struct SwiftUI_TutorialsApp: App {
    
    @StateObject var store = TutorialAppStore(landmarks: testLandmarks!)
    
    var body: some Scene {
        WindowGroup {
            HomeView(store: store)
        }
    }
}

class TutorialAppStore: ObservableObject {
    @Published var landmarks: [Landmark] = []
    
    init(landmarks: [Landmark] = []) {
        self.landmarks = landmarks
    }
}

let testStore = TutorialAppStore(landmarks: testLandmarks!)
