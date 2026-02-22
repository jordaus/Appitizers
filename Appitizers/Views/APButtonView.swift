//
//  APButtonView.swift
//  Appitizers
//
//  Created by Jordan Austin on 2/22/26.
//

import SwiftUI

struct APButtonView: View {
    let title : LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: 260)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButtonView(title : "Hello World")
}
