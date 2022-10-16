//
//  Cards.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/16.
//

import Foundation

struct Cards: Identifiable, Hashable{
    var id = UUID().uuidString
    var imageURL: String
    var name: String
    var subheadLine: String
    var price: String
    var oldPrice: String
}


extension Cards{
    static let cards = [
        Cards(
            imageURL: "overlay1",
            name: "Vista Chair",
            subheadLine: "Inspired by Acapulco chair designs",
            price: "$589",
            oldPrice: "$669"),
        Cards(imageURL: "overlay2", name: "Garden Chair", subheadLine: "For enjoying the outdoors", price: "$200", oldPrice: "$350"),
        Cards(imageURL: "overlay3", name: "SPD Chair", subheadLine: "Enjoying indoor spaces with elevation", price: "$480", oldPrice: "$895"),
        Cards(imageURL: "overlay4", name: "Mac Tray", subheadLine: "For your desert needs and parties", price: "$145", oldPrice: "$299")
    ]
}
