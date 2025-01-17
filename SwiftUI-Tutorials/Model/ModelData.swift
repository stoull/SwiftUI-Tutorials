//
//  ModelData.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/5.
//

import Foundation

var testLandmarks: [Landmark]? = load("landmarkData.json")

var categories: [String: [Landmark]] {
    Dictionary(
        grouping: testLandmarks!, by: { $0.category.rawValue }
    )
}

var hikes: [Hike]? = load("hikeData.json")

func load<T: Decodable>(_ filename: String) -> T? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension:nil)
    else {
        return nil
    }
    
    do {
        data = try Data(contentsOf: file)
        let tObj = try JSONDecoder().decode(T.self, from: data)
        return tObj
    } catch {
        return nil
    }
}
