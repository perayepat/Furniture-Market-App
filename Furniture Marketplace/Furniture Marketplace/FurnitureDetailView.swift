//
//  FurnitureDetailView.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/16.
//

import SwiftUI
import SceneKit

struct FurnitureDetailView: View {
    @State var scene: SCNScene? = .init(named: "ArmChair.scn")
    @State var onTapped:  Bool = false
    var body: some View {
        ScrollView {
            TopSection()
            //3D Preview
            CustomSceneView(scene: $scene)
                .frame(height: 380)
            FurnitureProperties()
                .overlay {
                    Button {
                        onTapped.toggle()
                    } label: {
                        Text("Add To Cart")
                            .frame(width: 350,height: 60)
                            .foregroundColor(.black)
                            .background(Color(hex: "dde5b6"))
                            .cornerRadius(35)
                    }
                    .offset(y:120)
                 
                }
            
        }
        .overlay {
            HStack {
                VStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                        .padding(5)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1)
                        }
                    Circle()
                        .foregroundColor(.brown)
                        .frame(width: 30, height: 30)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .offset(y:80)
        }
        .navigate(to: FurnitureGridView(), when: $onTapped)
        
    }
}

@ViewBuilder
func TopSection()-> some View{
    HStack{
        Image(systemName: "chevron.left")
            .padding()
            .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
        Spacer()
        Image(systemName: "star")
            .foregroundColor(.white)
            .padding()
            .background(.black, in: RoundedRectangle(cornerRadius: 15))
    }
    .padding()
}

@ViewBuilder
func FurnitureProperties()-> some View{
    VStack{
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Text("$589")
                    .foregroundColor(.orange)
                    .fontWeight(.semibold)
                    .font(.title2)
                Text("$669")
                    .foregroundColor(.gray)
                    .strikethrough()
                Spacer()
                
                HStack {
                    Image(systemName: "plus")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius:25))
                    Text("1")
                        .padding(.horizontal,5)
                        .foregroundColor(.white)
                    Image(systemName: "minus")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                }
            }
            Text("Vista Chair")
                .foregroundColor(.white)
                .font(.title)
                .bold()
            HStack(spacing: 10){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("4.8")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("102 sold")
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            Text("The designer refers to the shape as a reference to a distant view along an avenue. The lovely curve is elongated on the sofa and the ruffles in the fabric brings character and vibrance to the design. This two-seater sofa is a perfect addition to a hall or even a lobby, where it will be sure to catch the eye of anyone passing by. Designed by Anderssen & Voll.This item is available to be customised in different fabrics and colours, please get in touch with your local showroom for more information")
                .foregroundColor(.gray)
                .padding(.vertical)
                .lineSpacing(8)
                .lineLimit(3)
            Text("More info...")
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .padding(.top)

      
    
        Spacer()
    }
    .ignoresSafeArea()
    .frame( height: 500)
    .background(.black)
    .cornerRadius(40)
    
}

struct FurnitureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureDetailView()
    }
}
