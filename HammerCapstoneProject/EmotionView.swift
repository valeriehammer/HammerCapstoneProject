//
//  EmotionView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct EmotionView: View {
    var body: some View {
            VStack{
                Text("Reflections on Emotions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.teal)
                
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { TextField("How do you feel?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/) })
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
        //endbody
}
//endstruct

#Preview {
    EmotionView()
}
