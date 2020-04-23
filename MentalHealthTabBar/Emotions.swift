//
//  Emotions.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 3/27/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import Foundation
class Emotions {
    private init() {}
    static let shared = Emotions()
    var theEmotion = "default"
    var theTip = "Choose an emotion on the home page! Or, try taking a few deep breaths. This will clear your mind."
    func printMyEmotion() {
    }
}
