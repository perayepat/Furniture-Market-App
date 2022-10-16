//
//  FurnitureListView.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/16.
//

import SwiftUI

struct FurnitureListView: View {
    var cards = Cards.cards
    @State var onTapped:  Bool = false
    var body: some View {
        ScrollView {
            TopSection()
                .padding(.top,50)
            SegmentedSection()
                .padding(.bottom)
            ForEach(cards){ card in
                Button {
                    onTapped.toggle()
                } label: {
                    Rectangle()
                        .frame(width: 360, height: 130)
                        .cornerRadius(15)
                        .foregroundColor(Color(hex: "343a40"))
                        .padding(.vertical,5)
                        .overlay{
                            HStack{
                                Image(card.imageURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                VStack(alignment: .leading, spacing: 5){
                                    Text(card.name)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(card.subheadLine)
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                        .padding(.horizontal)
                                        
                                    HStack{
                                        Text(card.price)
                                            .foregroundColor(.orange)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text(card.oldPrice)
                                            .foregroundColor(.gray)
                                            .strikethrough()
                                        Spacer()
                                        Image(systemName: "cart")
                                            .foregroundColor(.black)
                                            .background {
                                                Circle()
                                                    .foregroundColor(Color(hex: "dde5b6"))
                                                    .frame(width: 40, height: 40)
                                            }
                                            
                                    }
                                    .padding(.trailing)
                                }
                                
                            }
                        }
                }
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 90)
        }
        .overlay {
            TabBarOptions()
        }
        .navigate(to: FurnitureDetailView(), when: $onTapped)
    }
    
    
    @ViewBuilder
    func TopSection()-> some View{
        HStack {
            HStack{
                HStack {
                    Label("Start to seach now", systemImage: "magnifyingglass")
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal, 40)
                }
                Spacer()
            }
            .background {
                Rectangle()
                    .foregroundStyle(.gray)
                    .cornerRadius(15)
                    .frame(width: 300)
            }
            //Prefrence Icon
            Image(systemName: "gearshape.2")
                .padding()
                .background(content: {
                    Rectangle()
                        .foregroundStyle(Color(hex: "dde5b6"))
                        .cornerRadius(10)
                })
                .padding(.trailing)
            
        }
    }
    
    @ViewBuilder
    func SegmentedSection()-> some View{
        VStack(spacing: 2) {
            HStack {
                Text("Everything Furniture")
                    .font(.system(.title2,weight: .semibold))
                    .padding(.vertical)
                    .padding()
                Spacer()
            }
            //Segmented Control
            HStack(spacing: 50){
                Text("Rent")
                    .padding()
                    .background {
                        Rectangle()
                            .foregroundStyle(Color(hex: "dde5b6"))
                            .frame(width: 180, height: 45)
                            .cornerRadius(40)
                    }
                Spacer()
                    .frame(width: 10)
                Text("Buy")
                    .foregroundColor(.white)
            }
            .frame(width: 250, height: 10)
            .padding()
            .padding(.horizontal)
            .background {
                Rectangle()
                    .foregroundStyle(.gray)
                    .cornerRadius(35)
            }
        }
    }
    
    @ViewBuilder
    func CardListView(card: Cards)-> some View{
        Button {
            
        } label: {
            Rectangle()
                .frame(width: 360, height: 130)
                .cornerRadius(15)
                .foregroundColor(Color(hex: "343a40"))
                .padding(.vertical,5)
                .overlay{
                    HStack{
                        Image(card.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                        VStack(alignment: .leading, spacing: 5){
                            Text(card.name)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text(card.subheadLine)
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding(.horizontal)
                                
                            HStack{
                                Text(card.price)
                                    .foregroundColor(.orange)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                Text(card.oldPrice)
                                    .foregroundColor(.gray)
                                    .strikethrough()
                                Spacer()
                                Image(systemName: "cart")
                                    .foregroundColor(.black)
                                    .background {
                                        Circle()
                                            .foregroundColor(Color(hex: "dde5b6"))
                                            .frame(width: 40, height: 40)
                                    }
                                    
                            }
                            .padding(.trailing)
                        }
                        
                    }
                }
        }
        
        
    }
    
    @ViewBuilder
    func TabBarOptions()-> some View{
        VStack {
            Spacer()
            Rectangle()
                .frame(height: 90)
                .cornerRadius(20)
                .overlay {
                    HStack(spacing: 50){
                        HStack {
                            Image(systemName: "archivebox")
                            Text("Furniture")
                              
                        }
                        .padding()
                        .background {
                            Rectangle()
                                .foregroundColor(Color(hex: "dde5b6"))
                                .cornerRadius(30)
                    }
                        
                        Image(systemName: "star")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Image(systemName: "square.text.square")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Image(systemName: "cart")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                }
        }
        .ignoresSafeArea()
    }
    
}

struct FurnitureListView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureListView()
    }
}
