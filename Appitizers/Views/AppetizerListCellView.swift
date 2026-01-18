//
//  AppetizerListCellView.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/23/26.
//

import SwiftUI

struct AppetizerListCellView: View {
    
    let appetizer: Appetizer
    var body: some View {
        HStack {
            Image(appetizer.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
                
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.price, format: .currency(code: "USD"))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    AppetizerListCellView(appetizer: MockData.appetizers[0])
}
