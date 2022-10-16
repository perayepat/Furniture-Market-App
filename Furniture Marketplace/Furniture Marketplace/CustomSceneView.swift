//
//  CustomSceneView.swift
//  3DEcommerceApp
//
//  Created by Pat on 2022/10/04.
//

import SwiftUI
import SceneKit

struct CustomSceneView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.antialiasingMode = .multisampling2X
        view.autoenablesDefaultLighting = true
        view.backgroundColor = .clear
        view.scene = scene
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.scene = scene
        
    }
}


struct CustomSceneView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
