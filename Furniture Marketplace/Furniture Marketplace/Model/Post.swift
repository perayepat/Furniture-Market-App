//
//  Post.swift
//  Furniture Marketplace
//
//  Created by Pat on 2022/10/14.
//

import Foundation

struct Post: Identifiable, Hashable{
    var id = UUID().uuidString
    var imageURL: String
    var overLayImage: String
}
