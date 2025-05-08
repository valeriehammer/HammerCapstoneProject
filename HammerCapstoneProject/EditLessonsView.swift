//
//  EditLessonsView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/8/25.
//

import SwiftUI
import SwiftData

struct EditLessonsView: View {
    var lesson: LessonsLearned
    @State private var newLessonLearned: String
    @State private var newLStamp: Date
    @Environment(\.dismiss) private var dismiss
    
    init(lesson: LessonsLearned) {
        self.lesson = lesson
        _newLessonLearned = State(initialValue: lesson.lessonLearned)
        _newLStamp = State(initialValue: lesson.lessonStamp)
    }
    //end init
    
    
    var body: some View {
        Form {
            TextField("Revise the lesson learned", text: $newLessonLearned)
            DatePicker("Change Date", selection: $newLStamp, displayedComponents: .date)
        }
        //endForm
        
        .navigationTitle("Edit Lesson Learned")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                //end Cancel Button
            }
            //end ToolbarItem
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    lesson.lessonLearned = newLessonLearned
                    lesson.lessonStamp = newLStamp
                    dismiss()
                }
                //end Button
            }
            //end ToolbarItem
        }
        //end.toolbar
    }
    //end body
}
//end struct

#Preview {
    NavigationStack {
        EditLessonsView(lesson: LessonsLearned(lessonLearned: "Test", lessonStamp: Date ()))
    }
}
