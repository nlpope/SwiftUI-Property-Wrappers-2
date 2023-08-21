//
//  SwiftUI_Property_Wrappers_2App.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

@main 
struct SwiftUI_Property_Wrappers_2App: App {
    var user = User(name: "Aang", luckyNumber: 100)
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView().environmentObject(user) //supplies an observable object (user) to a view subheirarchy
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

 --------------------------
 UPDATES & QUESTIONS:
 */
