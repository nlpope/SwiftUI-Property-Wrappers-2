//
//  NavDestinationView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

struct NavDestinationView: View {
    @EnvironmentObject var user: User //this must come from the ancestor
    var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number")
                    Text("\(user.luckyNumber)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                }
                Button("New Number") {
                    user.luckyNumber = Int.random(in: 21...30)
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.green)
                .cornerRadius(7)
            }
            .frame(width: 200)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { // <3>
                    VStack {
                        Text("User Name").font(.subheadline)
                        Text("\(user.name)").font(.headline)
                    }
                }
        }
    }
}

struct NavDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavDestinationView().environmentObject(User(name: "lilStewart", luckyNumber: 11))
    }
}

/**
 --------------------------
 NOTES:
 //does this need to be supplied the environ obj w .envirionment(user) if it's being pushed(?) on the stack via that nav button up top - it's not being presented is it? Is that why we don't need an 'isShowing' var up top?
 
 //and since it's pushed onto the navigation stack by that navigation link (not apart of OG hierarchy) we have to add tag / pass the enviro variable using .environmentObject(user) in the parent view just above it - i also think the updated version of swift nixed having to add that tag in most places, so is this part necessary outside of previews? - works fine w/out it
 
 //if you wanna see a navigation bar in the preview, just wrap NavDestinationView
 above in a NavigationView
 --------------------------
 UPDATES & QUESTIONS:
 
 //and since it's pushed onto the navigation stack by that navigation link (not apart of OG hierarchy) ... i also think the updated version of swift nixed having to add that tag in most places, so is this part necessary outside of previews? - works fine w/out it

 */
