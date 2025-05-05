//
//  GratitudeData.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import Foundation
import SwiftData

@Model
class GratefulMoment {
    var gratefulMoment: String
    var gratefulStamp: Date
    
    init(gratefulMoment: String, gratefulStamp: Date) {
        self.gratefulMoment = gratefulMoment
        self.gratefulStamp = gratefulStamp
    }
}
