//
//  EditEmotionView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/8/25.
//

import SwiftUI
import SwiftData

struct EditEmotionView: View {
    var reflection: EmotionReflection
    @State private var newEmotionReflection: String
    @State private var newEStamp: Date
    @Environment(\.dismiss) private var dismiss
    
    init(reflection: EmotionReflection) {
        self.reflection = reflection
        _newEmotionReflection = State(initialValue: reflection.emotionReflection)
        _newEStamp = State(initialValue: reflection.emotionStamp)
    }
    //end init
    
    
    var body: some View {
        Form {
            TextField("Revise your reflection", text: $newEmotionReflection)
            DatePicker("Change Date", selection: $newEStamp, displayedComponents: .date)
        }
        //endForm
        
        .navigationTitle("Edit Your Reflection")
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
                    reflection.emotionReflection = newEmotionReflection
                    reflection.emotionStamp = newEStamp
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
        EditEmotionView(reflection: EmotionReflection(emotionReflection: "Test", emotionStamp: Date ()))
    }
}
