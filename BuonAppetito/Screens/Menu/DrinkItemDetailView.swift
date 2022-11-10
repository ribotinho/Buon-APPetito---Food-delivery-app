//
//  DrinkMenuDetailView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 10/11/22.
//

import SwiftUI

struct DrinkItemDetailView: View {
    @ObservedObject var viewModel : StoreViewModel
    @State var item : DrinkItem
    @State var addButtonTapped : Bool = false
    @State var notificationXOffset : CGFloat = 0
    @State var notificationYOffset : CGFloat = -500
    @Binding var selectedTab : Int
    
    var body: some View {
        
        ZStack{
            
            notificationView()
            
            VStack {
                
                headerView()
                
                Spacer()
                
                addtoCartButton()
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
    
    @ViewBuilder
    func addtoCartButton() -> some View {
        
        Button {
            withAnimation{
                notificationYOffset = -384
            }
            withAnimation(Animation.linear.delay(1)){
                addButtonTapped = true
            }
            withAnimation(.linear.delay(2)){
                notificationXOffset = 150
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                viewModel.order(item: item)
                notificationXOffset = 0
                notificationYOffset = -500
                addButtonTapped = false
            }
        } label: {
            ZStack{
                Capsule()
                    .fill(.orange)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.horizontal)
                
                Label("Add to cart - \(String(format: "%.2f€", item.totalPrice))", systemImage: "cart.fill")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    @ViewBuilder
    func notificationView() -> some View {
        HStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            if !addButtonTapped {
                Text("added to cart")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .frame(width: addButtonTapped ? 30 : 150)
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .background(Capsule().fill(.orange))
        .offset(x:notificationXOffset, y: notificationYOffset)
        .opacity(notificationXOffset > 90 ? 0 : 1)
    }
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(alignment: .center) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:125, height: 125)
        }
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.type.rawValue.uppercased())
                    .foregroundColor(.secondary)
                Text(item.name)
                    .font(.title)
            }
            Spacer()
            
            MenuItemStepper(item: $item)
        }
        .padding(.horizontal)
    }
    
}

struct DrinkItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItemDetailView(viewModel: StoreViewModel(), item: DrinkItem.example, selectedTab: .constant(2))
    }
}
