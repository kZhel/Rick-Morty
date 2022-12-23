//
//  ContentView.swift
//  SwiftUIVersion
//
//  Created by Katya on 18.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import SwiftUI

struct FiltrationView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    var charView: CharactersViewController? = nil;
    
    public static func getInstance(charViewToFilter: CharactersViewController) -> FiltrationView {
        var retView: FiltrationView = FiltrationView();
        retView.charView = charViewToFilter;
        return retView
    }
    
    @State var status : String = ""
    @State var gender : String = ""
    enum Gender : String {
        case female,male,genderless,unknown
    }
    
    enum Status : String{
        case alive, dead, unknown
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
                    RadioButton(radioValue: self.$status, label: "Alive",value:Status.alive.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$status, label: "Dead",value: Status.dead.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$status, label: "Unknown",value:Status.unknown.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
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
                    RadioButton(radioValue: self.$gender, label: "Female", value: Gender.female.rawValue,colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: "Male", value: Gender.male.rawValue,colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: "Genderless",value: Gender.genderless.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
                }
                HStack{
                    RadioButton(radioValue: self.$gender, label: "Unknown",value: Gender.unknown.rawValue, colorPicked: self.colorPicked, colorNotPicked: self.colorNotPicked)
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
        charView?.setFiltration(status: self.status, gender: self.gender)
    }
    
    func onResetGenderClick() {
        //todo: reset gender and radios
        self.gender = ""
        charView?.setFiltration(status: self.status, gender: self.gender)
    }
    
    func applyFilters() {
        //todo: well...apply filters, ig
            charView?.setFiltration(status: self.status, gender: self.gender)
            
            //todo: close filtration window on applyFilters, bc we don't need it anymore (and show charactersViewController)
            self.presentationMode.wrappedValue.dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FiltrationView()
    }
}

struct RadioButton : View {
    @Binding var radioValue : String
    var label: String
    var value: String
    var colorPicked: Color
    var colorNotPicked: Color
    
    var body: some View {
        Button(action:{self.radioValue = self.value}) {
            Text("   ")
                .frame(width:20,height:20)
                .foregroundColor(Color.black)
                .background(radioValue == value ? colorPicked:nil)
                .cornerRadius(100)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(radioValue == value ? colorPicked:colorNotPicked,lineWidth: 6)
                    .scaleEffect(0.5))
            Text(label).frame(maxWidth: .infinity,alignment: .leading)    .frame(maxWidth: .infinity,alignment: .leading)
            .font(Font.headline.weight(.bold))
            .foregroundColor(radioValue == value ? colorPicked:colorNotPicked)
        }
    }
}


