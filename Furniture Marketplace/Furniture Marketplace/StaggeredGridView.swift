//
//  StaggeredGridView.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/14.
//

import SwiftUI
// Custom View Builder
// T to hold the identifiable collection of data

struct StaggeredGridView<Content: View,T: Identifiable>: View where T: Hashable {
    
    // It will return each object from the collection and build the view
    var content: (T) -> Content
    var list: [T]
    
    //Columns
    var columns: Int
    
    //Properties
    var showIndicators: Bool
    var spacing: CGFloat
    
    
    init(columns: Int,showIndicators: Bool = false,spacing: CGFloat = 10,list: [T], @ViewBuilder content: @escaping (T) -> Content){
        self.spacing = spacing
        self.showIndicators = showIndicators
        self.content = content
        self.list = list
        self.columns = columns
    }
    
    //Staggered Grid Funciton ..
    func setUpList()->[[T]]{
        
        //empty sub arrays of columns count...
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        //splitting array for Vstack oriented View ..
        var currentIndex = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            ///increasing index count and resetting if overbounds
            if currentIndex == (columns - 1){
                currentIndex = 0
            }else{
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            VStack(alignment: .center){
                ForEach(setUpList(),id: \.self){columnsData in
                    
                    //LazyStack for optimisation
                    LazyHStack(spacing: spacing) {
                        ForEach(columnsData){object in
                            content(object)
                        }
                    }
                }
            }
            ///only Vertical padding
            /// horizontal padding will be user's optional
            .padding(.horizontal,5)
        }
    }
}

struct StaggeredGridView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureGridView()
    }
}
