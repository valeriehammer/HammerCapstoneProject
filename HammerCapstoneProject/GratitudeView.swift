//
//  GratitudeView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct GratitudeView: View {
    @Query private var gratefulMoments: [GratefulMoment]
    @Environment(\.modelContext) private var context
    @State private var newGratefulMoment = ""
    @State private var newStamp = Date.now
    @State private var selectedGratefulMoment: GratefulMoment?
    
    var body: some View {
        ZStack {
            VStack{
                Text("Moments of Gratitude")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                
                DatePicker(selection: $newStamp, displayedComponents: .date, label: { TextField("What are you thankful for?", text: $newGratefulMoment) })
                
                Button {
                    let newMoment = GratefulMoment(gratefulMoment: newGratefulMoment, gratefulStamp: newStamp)
                    context.insert(newMoment)
                    newGratefulMoment = ""
                    newStamp = Date.now
                } label: {
                    Text("Save Entry")
                }
                
                List {
                    ForEach(gratefulMoments) { moment in
                        HStack{
                            Text(moment.gratefulMoment)
                            Spacer()
                            Text(moment.gratefulStamp, format: .dateTime.month(.wide).day().year())
                        }
                        //  end HStack
                        .onTapGesture {
                            selectedGratefulMoment = moment
                        }
                    }
                    .onDelete(perform: deleteMoment)
                }
                //endList
            }
            //endVStack
            .padding()
        }
        
    }
    //end body
    
    func deleteMoment(at offsets: IndexSet) {
        for index in offsets {
            let momentToDelete = gratefulMoments[index]
            context.delete(momentToDelete)
        }
    }
    // end deleteFriend function
}
//end struct

#Preview {
    GratitudeView()
        .modelContainer(for: GratefulMoment.self, inMemory: true)
}
