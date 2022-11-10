//
//  ContentView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 1/11/22.
//

import SwiftUI

struct MenuView: View {
    
    let columns : [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @ObservedObject var viewModel : StoreViewModel
    @Binding var selectedTab : Int
    @State var filteredItems : [any StoreItem] = []
    @State var selectedType : ItemType = .all {
        didSet {
            switch selectedType {
            case .pizza, .beverage, .burger, .dessert:
                filteredItems = viewModel.getItems(for: selectedType)
            case .all:
                filteredItems = viewModel.items
            }
        }
    }
    
    var body: some View {
        NavigationStack() {
            
            ZStack {
                Color(UIColor.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    header
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, alignment: .leading) {
                            ForEach(filteredItems, id: \.anyHashableID){ item in
                                NavigationLink(destination: MenuDetailView(viewModel: viewModel, item: item, selectedTab: $selectedTab)) {
                                    MenuItemCellView(item: item)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Buon APPetito")
            .onAppear{
                viewModel.fetch() // simulating NetworkCall
                selectedType = .all
            }
            .toolbar {
                ToolbarItem{
                    CartToolBarView(viewModel: viewModel)
                        .onTapGesture {
                            selectedTab = 2
                        }
                }
            }
        }
    }
    
    var header: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ItemType.allCases, id: \.self) { type in
                    ZStack {
                        Rectangle()
                            .fill(type == selectedType ? Color.orange : Color.white)
                            .cornerRadius(10)
                            .zIndex(0)
                            .frame(width: 100, height: 40)
                            .onTapGesture {
                                selectedType = type
                            }
                            .padding(.vertical)
                        
                        HStack {
                            Image(type.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:25, height:25)
                            Text(type.rawValue)
                                .foregroundColor(type == selectedType ? .white : .black)
                                .font(.caption)
                                .bold()
                        }
                        .zIndex(1)
                    }
                }
            }
        }
        .padding(.leading)
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: StoreViewModel(), selectedTab: .constant(2))
    }
}
