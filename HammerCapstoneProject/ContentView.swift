//
//  ContentView.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.mint
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("notebook")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    Text("Life Watching")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                    Text("Daily notes for thoughtful living")
                        .font(.title3)
                    
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.003, green: 0.371, blue: 0.565))
                        .multilineTextAlignment(.center)
                    
                    Text("")
                    Text("")
                    Text("")
                    
                    NavigationLink(destination: GratitudeView()) { Text("Add A Moment of Gratitude")
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.003, green: 0.371, blue: 0.565))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Capsule())
                    }
                    //end Navigation Link to GratitudeView
                    
                    
                    NavigationLink(destination: LessonsView()) {
                        Text("Add a Lesson Learned")
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.003, green: 0.371, blue: 0.565))
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.071, saturation: 0.208, brightness: 0.979)/*@END_MENU_TOKEN@*/)
                            .font(.title)
                            .clipShape(Capsule())
                        }
                    //end Navigation to LessonsView
                    
                    NavigationLink(destination: EmotionView()) {
                        Text("Reflect on Emotions")
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.003, green: 0.371, blue: 0.565))
                            .foregroundColor(.orange)
                            .font(.title)
                            .clipShape(Capsule())
                        }
                    //end Navigation to EmotionView
                
                }
                //end VStack
                .padding()
            }
            //end ZStack
        }
        .accentColor(.white)
        //end NavStack
    }
    //end body
}
//end struct

#Preview {
    ContentView()
}
