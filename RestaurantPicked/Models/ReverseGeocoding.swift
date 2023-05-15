//
//  ReverseGeocoding.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import Foundation

// MARK: - Welcome
struct GeoWelcome: Codable {
    let status: Status
    let results: [GeoResult]
}

// MARK: - Result
struct GeoResult: Codable {
    let name: String
    let code: Code
    let region: Region
}

// MARK: - Code
struct Code: Codable {
    let id, type, mappingID: String

    enum CodingKeys: String, CodingKey {
        case id, type
        case mappingID = "mappingId"
    }
}

// MARK: - Region
struct Region: Codable {
    let area0, area1, area2, area3: Area
    let area4: Area
}

// MARK: - Area
struct Area: Codable {
    let name: String
    let coords: Coords
}

// MARK: - Coords
struct Coords: Codable {
    let center: Center
}

// MARK: - Center
struct Center: Codable {
    let crs: String
    let x, y: Double
}

// MARK: - Status
struct Status: Codable {
    let code: Int
    let name, message: String
}

 
