//
//  EmotionView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct EmotionView: View {
    @Query(sort: \EmotionReflection.emotionStamp, order: .reverse) private var reflections: [EmotionReflection]
    @Environment(\.modelContext) private var context
    @State private var newReflection = ""
    @State private var newEStamp = Date.now
    @State private var selectedEmotionReflection: EmotionReflection?
    
    var body: some View {
        ZStack{
            Color(.mint)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Reflections on Emotions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                
                DatePicker(selection: $newEStamp, displayedComponents: .date, label: { TextField("How do you feel?", text: $newReflection) })
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        .background(Color.white)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                   
                
                Button {
                    let newEmotionReflection = EmotionReflection(emotionReflection: newReflection, emotionStamp: newEStamp)
                    context.insert(newEmotionReflection)
                    newReflection = ""
                    newEStamp = Date.now
                } label: {
                    Text("Save Entry")
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(red: 0.003, green: 0.371, blue: 0.565))
                        .clipShape(Capsule())
                }
                List {
                    ForEach(reflections) { reflection in
                        HStack{
                            Text(reflection.emotionReflection)
                            Spacer()
                            Text(reflection.emotionStamp, format: .dateTime.month(.wide).day().year())
                        }
                        .onTapGesture {
                            selectedEmotionReflection = reflection
                        }
                        //endHStack
                    }
                    .onDelete(perform: deleteReflection)
                    //endForEach
                }
                .scrollContentBackground(.hidden)
                .background(Color.mint)
                //endList
                
                .sheet(item: $selectedEmotionReflection) { reflection in
                    NavigationStack {
                        EditEmotionView(reflection: reflection)
                    }
                    // end Navigation Stack
                }
                // end .sheet
                
            }
            //endVStack
            .padding()
        }
        //endZStack
    }
    //endbody
    
    func deleteReflection(at offsets: IndexSet) {
        for index in offsets {
            let reflectionToDelete = reflections[index]
            context.delete(reflectionToDelete)
        }
    }
    // end deleteFriend function
    
}
//endstruct

#Preview {
    EmotionView()
        .modelContainer(for: EmotionReflection.self, inMemory: true)
}
