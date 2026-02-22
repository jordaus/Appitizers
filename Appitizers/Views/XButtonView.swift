//
//  XButtonView.swift
//  Appitizers
//
//  Created by Jordan Austin on 2/22/26.
//

import SwiftUI

struct XButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.8)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XButtonView()
}
