//
//  ContentView.swift
//  SwiftUIVersion
//
//  Created by Katya on 18.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var status : String = ""
    @State var gender : String = ""
    enum Gender : String {
        case Female,Male,Genderless,Unknown
    }
    
    enum Status : String{
        case Alive, Dead, Unknown
    }
    var colorNotPicked : Color = Color.white
    var colorPicked : Color = Color.green
    var backgroundColor : Color = Color(red: 0.15, green: 0.15, blue: 0.19, opacity: 1)
    
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundColor.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20.0) {
                HStack{
                    Text("Status")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(Color.green)
                    Button(action:{self.onResetStatusClick()}) {
                        Text("Reset")
                        .foregroundColor(Color.red)
                    }
                }
                
                HStack{
                    RadioButton(radioValue: self.$status, label: Status.Alive.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$status, label: Status.Dead.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$status, label: Status.Unknown.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                                
                HStack{
                    Text("Gender")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(Color.green)
                    Button(action:{self.onResetGenderClick()}) {
                        Text("Reset")
                        .foregroundColor(Color.red)
                    }
                    
                }
                
                HStack{
                    RadioButton(radioValue: self.$gender, label: Gender.Female.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: Gender.Male.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: Gender.Genderless.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: Gender.Unknown.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }

                
                
                VStack(alignment: .trailing){
                    Button(action: {self.applyFilters()}) {
                        Text("Apply filters")
                            .foregroundColor(colorPicked)
                    }
                }.frame(maxHeight: .infinity,
                        alignment: .bottom)
            }.padding(40)
            
        }
    }
    
    func onResetStatusClick() {
        //todo: reset radioButtons and status
        self.status = ""
    }
    
    func onResetGenderClick() {
        //todo: reset gender and radios
        self.gender = ""
    }
    
    func applyFilters() {
        //todo: well...apply filters, ig
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RadioButton : View {
    @Binding var radioValue : String
    var label: String
    var colorPicked: Color
    var colorNotPicked: Color
    
    
    var body: some View {
        Button(action:{self.radioValue = self.label}) {
            Text("   ")
                .frame(width:20,height:20)
                .foregroundColor(Color.black)
                .background(radioValue == label ? colorPicked:nil)
                .cornerRadius(100)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(radioValue == label ? colorPicked:colorNotPicked,lineWidth: 6)
                    .scaleEffect(0.5))
            Text(label).frame(maxWidth: .infinity,alignment: .leading)    .frame(maxWidth: .infinity,alignment: .leading)
            .font(Font.headline.weight(.bold))
            .foregroundColor(radioValue == label ? colorPicked:colorNotPicked)
        }
    }
}


