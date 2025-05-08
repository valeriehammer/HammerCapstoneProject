//
//  EditGratitudeView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/6/25.
//

import SwiftUI
import SwiftData

struct EditGratitudeView: View {
    var moment: GratefulMoment
    @State private var newGratefulMoment: String
    @State private var newStamp: Date
    @Environment(\.dismiss) private var dismiss
    
    init(moment: GratefulMoment) {
        self.moment = moment
        _newGratefulMoment = State(initialValue: moment.gratefulMoment)
        _newStamp = State(initialValue: moment.gratefulStamp)
    }
    //end init
    
    
    var body: some View {
        Form {
            TextField("Revise what you're grateful for", text: $newGratefulMoment)
            DatePicker("Change Date", selection: $newStamp, displayedComponents: .date)
        }
        //endForm
        
        .navigationTitle("Edit Grateful Moment")
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
                    moment.gratefulMoment = newGratefulMoment
                    moment.gratefulStamp = newStamp
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
        EditGratitudeView(moment: GratefulMoment(gratefulMoment: "Test", gratefulStamp: Date ()))
    }
}
