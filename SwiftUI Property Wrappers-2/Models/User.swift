//
//  User.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Noah Pope on 8/14/23.
//

import SwiftUI

class User: ObservableObject {
    @AppStorage("lastLuckyNumber") var lastLuckyNumber: Int = 0
    internal init(name: String, luckyNumber: Int) {
        self.name = name
        self.luckyNumber = lastLuckyNumber
    }
    
    //these must be published to use environment
    @Published var name: String
    @Published var luckyNumber: Int = 10 {
        didSet {
            lastLuckyNumber = oldValue
        }
    }
}

/**
 --------------------------
 NOTES:
 @AppStorage("lastLuckyNumber")var lastLuckyNumber: Int = 0
//im guessin anything wrapped in AppStorage wrapper needs to be initialized
 
 
 internal init(name: String, luckyNumber: Int) {
     self.name = name
     self.luckyNumber = lastLuckyNumber
 }
 //since this is a class not a struct, swift won't auto-gen an init method for
 //our parameters
 
 
 @Published var luckyNumber: Int {
     didSet {
         lastLuckyNumber = oldValue
     }
 }
 
 //oldValue = default param stashed in didSet you can use instead of repeating luckyNumber
 //now it's in app storage to be used on reboot
 --------------------------
 UPDATES & QUESTIONS:
 //why do we get error up top when trying to set self.luckyNumber = lastLuckyNumber?
 //b/c this stored property (luckyNumber), below needs to have an initial value before you can
 //... plug / assign other values to it in the init( )
 
 //giving luckyNumber prop in User model back its default value to be altered in the init() - using its "oldValue" in the didSet on the first click
 */
