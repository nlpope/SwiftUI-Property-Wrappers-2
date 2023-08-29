//
//  SwiftUI_Property_Wrappers_2App.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

@main 
struct SwiftUI_Property_Wrappers_2App: App {
    //where type User gets instantiated for whole app - starts as muggle 
    private var loser = User(name: "Azmuth", luckyNumber: 10000)
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView().environmentObject(loser) //supplies an observable object (user) to a view subheirarchy
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

/**
 --------------------------
 NOTES:
 // ContentView().environmentObject(user)  - supplies an observable object (user) to a view subheirarchy
 //so basically we're creating the variable here as a normal var
 //...then setting it up as a global environment var available to all views under any view with the tag .environmentObject(ObservableObject)

 //8.25 reading up on initializers and defaults before continuing
 
 //8.29 reading up on initializers
 --------------------------
 UPDATES & QUESTIONS:
 */
