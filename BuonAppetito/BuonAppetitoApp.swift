//
//  BuonAppetitoApp.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 1/11/22.
//

import SwiftUI

@main
struct BuonAppetitoApp: App {
    
    init() {
        UITabBarItem.appearance().badgeColor = .orange
    }
    
    @StateObject var viewModel = StoreViewModel()
    @State var selectedTab = 1
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab){
                
                MenuView(viewModel: viewModel, selectedTab: $selectedTab)
                    .tabItem {
                        Label("Menu", systemImage: "fork.knife")
                    }
                    .tag(1)
                
                CartView(viewModel: viewModel)
                    .tabItem {
                        Label("Cart", systemImage: "cart.fill")
                    }
                    .tag(2)
                    .badge(viewModel.orders.count > 0 ? viewModel.orderCount: 0)
            }
        }
    }
}
