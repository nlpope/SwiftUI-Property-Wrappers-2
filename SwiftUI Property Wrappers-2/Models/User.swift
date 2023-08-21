//
//  User.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Noah Pope on 8/14/23.
//

import Foundation

class User: ObservableObject {
    internal init(name: String, luckyNumber: Int) {
        self.name = name
        self.luckyNumber = luckyNumber
    }
    
    //these must be published to use environment
    @Published var name: String
    @Published var luckyNumber: Int
}
