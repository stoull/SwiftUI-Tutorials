//
//  MapView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/8.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D {
        didSet {
            region_bunding = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 22.568982443127794, longitude: 113.98439038880181),
                span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            )
        }
    }
    
    @State private var region_bunding = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.568982443127794, longitude: 113.98439038880181),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    )
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(position: .constant(.region(region)))
        } else {
            // Fallback on earlier versions
            Map(coordinateRegion: $region_bunding)
        }
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 22.568982443127794, longitude: 113.98439038880181))
}
