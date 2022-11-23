//
//  LoadingAnimationView.swift
//  Rick&Morty
//
//  Created by Katya on 21.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import SwiftUI

struct LoadingAnimationView: View {
    @State var mortyLookIAmAnimationRick = false
    
    var backgroundColor : Color = Color(red: 0.15, green: 0.15, blue: 0.19, opacity: 1)
    var repeatingAnimation: Animation {
        Animation
            .linear(duration: 2)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack(alignment : .top) {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(spacing: 80){
                Image("title").resizable().frame(maxHeight: 200)
                Image("assetRick").resizable().frame(maxWidth:200, maxHeight: 400).rotation3DEffect(.degrees(mortyLookIAmAnimationRick ? 0:360), axis: (x: 0.0, y: 1.0, z: 0.0)).onAppear(){
                    withAnimation(self.repeatingAnimation){
                        self.mortyLookIAmAnimationRick.toggle()
                    }
                }
            }.padding(.all,40)
        }
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
