//
//  Alert.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/29/26.
//

import Foundation
import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Unable to complete"), message: Text("Unable to complete your request."), dismissButton: .default(Text("OK")))
}
