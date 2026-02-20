//
//  ContentView.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/17/26.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
        .accentColor(.appBrandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
