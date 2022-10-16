//
//  FurnitureGridView.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/14.
//

import SwiftUI

struct FurnitureGridView: View {
    @State var posts: [Post] = []
    @State var onTapped:  Bool = false
    
    var body: some View {
        NavigationView{
            StaggeredGridView(columns: 2,list: posts, content: { post in
                PostCardView(post: post)
            })
            .navigationTitle("Suggested")
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        ContinueButton()
                        Spacer()
                    }
                    .padding()
                }
                .background {
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 500, height: 120)
                            .foregroundStyle(.linearGradient(Gradient(colors: [.clear,.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                    }.ignoresSafeArea()
                    
                }
            }
        }
        .onAppear{
            for index in 1...11{
                posts.append(Post(imageURL: "image\(index)", overLayImage: "overlay\(index)"))
            }
        }
        .navigate(to: FurnitureListView(), when: $onTapped)
        

        
    }
    
    @ViewBuilder
    func ContinueButton()-> some View{
        HStack {
            Button {
                onTapped.toggle()
            } label: {
    //            Text("Continue")
                Rectangle()
                    .frame(width: 150, height: 50)
                    .cornerRadius(25)
                    .foregroundColor(Color(hex: "dde5b6"))
                    .overlay {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
        }
            Spacer()
            HStack(spacing: -5){
                ForEach(0 ..< 3) { item in
                    Image(systemName: "chevron.right")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundStyle(.white)
                }
            }
        }

    }
}

struct FurnitureGridView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureGridView()
            
    }
}

struct PostCardView:View{
    var post: Post
    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .foregroundColor(Color(hex: "#f5f5f5"))
            .shadow(color: .gray.opacity(0.8), radius: 1, x: 2, y: 5)
            .shadow(color: .gray.opacity(0.1), radius: 5, x: -2, y: -3)
            .overlay {
                Image(post.overLayImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250)

            }
    }
}

