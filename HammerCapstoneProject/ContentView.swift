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
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: GratitudeView()) { Text("Add A Moment of Gratitude")
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.blue)
                            .font(.title)
                            .clipShape(Capsule())
                    }
                    //end Navigation Link to GratitudeView
                    
                    
                    NavigationLink(destination: LessonsView()) {
                        Text("Add a Lesson Learned")
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.orange)
                            .font(.title)
                            .clipShape(Capsule())
                        }
                    //end Navigation to LessonsView
                    
                    NavigationLink(destination: EmotionView()) {
                        Text("Reflect on Emotions")
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.teal)
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
        //end NavStack
    }
    //end body
}
//end struct

#Preview {
    ContentView()
}
