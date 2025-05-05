//
//  EmotionData.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import Foundation
import SwiftData

@Model
class EmotionReflection {
    var emotionReflection: String
    var emotionStamp: Date
    
    init(emotionReflection: String, emotionStamp: Date) {
        self.emotionReflection = emotionReflection
        self.emotionStamp = emotionStamp
    }
}
