//
//  GratitudeView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI

struct GratitudeView: View {
    var body: some View {
        VStack{ 
            Text("Moments of Gratitude")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, displayedComponents: .date, label: { TextField("What are you thankful for?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/) })
            
            Button {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Text("Save Entry")
            }
           
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
            //endList
        }
        //endVStack
        .padding()
    }
    //end body
}
//end struct

#Preview {
    GratitudeView()
}
