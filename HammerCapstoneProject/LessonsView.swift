//
//  LessonsView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct LessonsView: View {
    @Query(sort: \LessonsLearned.lessonStamp, order: .reverse) private var lessons: [LessonsLearned]
    @Environment(\.modelContext) private var context
    @State private var newLesson = ""
    @State private var newLStamp = Date.now
    @State private var selectedLessonsLearned: LessonsLearned?

    
    var body: some View {
        ZStack {
            Color.teal
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Lessons Learned")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                
                DatePicker(selection: $newLStamp, displayedComponents: .date, label: { TextField("What did you learn today?", text: $newLesson) })
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        .background(Color.white)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                
                Button {
                    let newLessonLearned = LessonsLearned(lessonLearned: newLesson, lessonStamp: newLStamp)
                    context.insert(newLessonLearned)
                    newLesson = ""
                    newLStamp = Date.now
                } label: {
                    Text("Save Entry")
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(red: 0.003, green: 0.371, blue: 0.565))
                        .clipShape(Capsule())
                }
                
                List {
                    ForEach(lessons) { lesson in
                        HStack{
                            Text(lesson.lessonLearned)
                            Spacer()
                            Text(lesson.lessonStamp, format: .dateTime.month(.wide).day().year())
                        }
                        .onTapGesture {
                            selectedLessonsLearned = lesson
                        }
                        //endHStack
                    }
                    .onDelete(perform: deleteLesson)
                    //endForEach
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
    //end body
    
    func deleteLesson(at offsets: IndexSet) {
        for index in offsets {
            let lessonToDelete = lessons[index]
            context.delete(lessonToDelete)
        }
    }
    // end deleteFriend function
}
//end struct

#Preview {
    LessonsView()
        .modelContainer(for: LessonsLearned.self, inMemory: true)
}
