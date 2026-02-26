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
    /// Alerts for APError
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("The data recieved from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Unable to complete"), message: Text("Unable to complete your request."), dismissButton: .default(Text("OK")))
    
    /// Alerts for Account Creation
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form are filled out."), dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please ensure your email is correct."), dismissButton: .default(Text("OK")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile information was successfully saved."), dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Invalid User Data"), message: Text("There was an error retrieving your profile information."), dismissButton: .default(Text("OK")))
}
