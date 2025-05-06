//
//  GratitudeView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct GratitudeView: View {
    @Query(sort: \GratefulMoment.gratefulStamp, order: .reverse) private var gratefulMoments: [GratefulMoment]
    @Environment(\.modelContext) private var context
    @State private var newGratefulMoment = ""
    @State private var newStamp = Date.now
    @State private var selectedGratefulMoment: GratefulMoment?
    
    var body: some View {
        ZStack {
            Color(red: 0.003, green: 0.371, blue: 0.565)
                .ignoresSafeArea(.all)
            VStack {
                Text("Moments of Gratitude")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                DatePicker(selection: $newStamp, displayedComponents: .date, label: { TextField("What are you thankful for?", text: $newGratefulMoment)
                        .foregroundColor(.black)
                })
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .background(Color.white)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                
                Button {
                    let newMoment = GratefulMoment(gratefulMoment: newGratefulMoment, gratefulStamp: newStamp)
                    context.insert(newMoment)
                    newGratefulMoment = ""
                    newStamp = Date.now
                } label: {
                    Text("Save Entry")
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(red: 0.003, green: 0.371, blue: 0.565))
                        .clipShape(Capsule())
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
                .scrollContentBackground(.hidden)
                .background(Color(Color(red: 0.003, green: 0.371, blue: 0.565)))
                //endList
            }
            //endVStack
            .padding()
        }
        //end ZStack
        
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
