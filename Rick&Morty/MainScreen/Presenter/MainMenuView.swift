//
//  MainMenuView.swift
//  Rick&Morty
//
//  Created by Katya on 21.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import SwiftUI


struct MainMenuView: View {
    let navController =  UINavigationController()
    var backgroundColor : Color = Color(red: 0.15, green: 0.15, blue: 0.19, opacity: 1)
    
    var body: some View {
        ZStack(alignment: .center){
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing:40.0){
                MenuCardView(label: "Characters", image : Image("screamingSunBackground"),linkedVC: CharactersViewController(),parentNavigationController: navController)
            }.padding(.all)
        }
    }
    
}

struct MenuCardView : View{
    var label : String
    var image : Image
    var linkedVC : UIViewController
    var parentNavigationController : UINavigationController
    
    var body: some View {
        Button(action: {self.openLinkedView()}){
            Text(self.label).foregroundColor(Color.black).font(.title).fontWeight(.bold)
        }.frame(maxWidth: 380, maxHeight: 250).background(Color.white.opacity(0.4)).background(image.resizable()).cornerRadius(20.0)
    }
    
    func openLinkedView() {
        parentNavigationController.pushViewController(linkedVC, animated: true)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
