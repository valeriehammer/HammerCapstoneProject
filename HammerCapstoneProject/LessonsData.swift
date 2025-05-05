//
//  LessonsData.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import Foundation
import SwiftData

@Model
class LessonsLearned {
    var lessonLearned: String
    var lessonStamp: Date
    
    init(lessonLearned: String, lessonStamp: Date) {
        self.lessonLearned = lessonLearned
        self.lessonStamp = lessonStamp
    }
}
