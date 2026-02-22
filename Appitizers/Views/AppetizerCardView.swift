//
//  AppetizerCardView.swift
//  Appitizers
//
//  Created by Jordan Austin on 2/22/26.
//

import SwiftUI

struct AppetizerCardView: View {
    let appetizer : Appetizer
    @Binding var isShowingDetailView : Bool
    var body: some View {
        VStack {
            Image(appetizer.imageURL)
                .resizable()
                .scaledToFit()
                .frame(width: 320, height: 225)
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            HStack {
                NutritionInfoView(title: "Calories", value: appetizer.calories)
                NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                NutritionInfoView(title: "Protein", value: appetizer.protein)
            }
            .padding()
            Button {
                //action to add to order
            } label: {
                APButtonView(title: "\(appetizer.price, format: .currency(code: "USD")) - Add to Order")
            }
            .padding(.bottom, 30)
                
        }
        .frame(width: 320, height: 515)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
                //action to dismiss card
                isShowingDetailView = false
            } label: {
                XButtonView()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerCardView(appetizer: MockData.appetizers[0], isShowingDetailView: .constant(true))
}

struct NutritionInfoView: View {
    let title: String
    let value: Int
    var body : some View {
        VStack {
            Text(title)
                .font(.headline)
            Text("\(value)")
                .font(.subheadline)
                .italic()
        }
    }
}
