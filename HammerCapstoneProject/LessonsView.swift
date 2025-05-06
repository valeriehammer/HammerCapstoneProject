//
//  LessonsView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct LessonsView: View {
    var body: some View {
        ZStack {
            Color.teal
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Lessons Learned")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                
                DatePicker(selection: .constant(Date()), displayedComponents: .date, label: { TextField("What did you learn today?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/) })
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        .background(Color.white)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save Entry")
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(red: 0.003, green: 0.371, blue: 0.565))
                        .clipShape(Capsule())
                }
                
                List {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
                .scrollContentBackground(.hidden)
                .background(Color.teal)
                //endList
            }
            //endVStack
            .padding()
        }
        //endZStack
    }
}

#Preview {
    LessonsView()
}
