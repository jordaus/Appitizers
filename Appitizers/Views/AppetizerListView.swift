//
//  AppetizerListView.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/17/26.
//

import SwiftUI
import PhotosUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    

    var body: some View {
        ZStack {
            NavigationStack{
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCellView(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                        .padding(.leading)
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView {
                AppetizerCardView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
