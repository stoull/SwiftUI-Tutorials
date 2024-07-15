//
//  CategoryHome.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/15.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var store: TutorialAppStore
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationSplitView {
                List {
                    store.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                    
                    ForEach(store.categories.keys.sorted(), id: \.self) { key in
                        //                    Text(key)
                        CategoryRow(categoryName: key, items: store.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .navigationTitle("Featured")
            } detail: {
                Text("Select a Landmark")
            }
        } else {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        store.features[0].image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .listRowInsets(EdgeInsets())
                        
                        ForEach(store.categories.keys.sorted(), id: \.self) { key in
                            //                    Text(key)
                            CategoryRow(categoryName: key, items: store.categories[key]!)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                .navigationTitle("Featured")
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(TutorialAppStore(landmarks: testLandmarks!))
}
