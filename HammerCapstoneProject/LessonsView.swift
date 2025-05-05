//
//  LessonsView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI

struct LessonsView: View {
    var body: some View {
        VStack{
            Text("Lessons Learned")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
            
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, displayedComponents: .date, label: { TextField("What did you learn today?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/) })
            
            Button {
                
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
}

#Preview {
    LessonsView()
}
