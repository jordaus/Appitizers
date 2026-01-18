//
//  Appetizer.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/18/26.
//

import Foundation

struct Appetizer: Identifiable, Codable {
    let name: String
    let description: String
    let protein: Int
    let id: Int
    let calories: Int
    let price: Double
    let carbs: Int
    let imageURL: String
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(name: "Test Appetizer", description: "This is a test description for an appetizer.", protein: 10, id: 1, calories: 250, price: 5.99, carbs: 30, imageURL: "asian-flank-steak")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
