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
    @Published var luckyNumber: Int  {
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
 */
