//
//  SwiftUI_TutorialsApp.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import SwiftUI

@main
struct SwiftUI_TutorialsApp: App {
    
    @StateObject var store = AppStore(landmarks: testLandmarks!)
    
    var body: some Scene {
        WindowGroup {
            APPTabView()
                .environmentObject(store)
        }
    }
}
