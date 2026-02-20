//
//  AppetizerListViewModel.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/29/26.
//

import Foundation
internal import Combine

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading : Bool = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            //forces network command to run on main thread
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
