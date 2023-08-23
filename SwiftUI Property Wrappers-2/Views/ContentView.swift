//
//  ContentView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    //@EnvironmentObject var user: User
    //@EnvironmentObj. = "I can read the 'user' var passed in my parent" - name match arb.
    @EnvironmentObject private var user: User
    @State private var presentModal = false
    @FocusState private var nameFieldIsFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number:")
                    Text("\(user.luckyNumber)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                }
                Group {
                    Button("New Number") {
                        user.luckyNumber = Int.random(in: 1...10)
                    }
                    
                    Button("Show Modal") {
                        presentModal = true
                    }
                    .sheet(isPresented: $presentModal) {
                        ModalSheetView(isShowing: $presentModal)
                        
                    }
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(.blue)
                .cornerRadius(7)
                
                // MARK: - EDIT NAME FIELDS
                Group {
                    HStack {
                        Text("Edit Name:")
                        TextField(
                            "Edit Your User Name",
                            text: $user.name
                        )
                        .autocorrectionDisabled(true)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(.black, lineWidth: 2)
                        )
                        .focused($nameFieldIsFocused)
                        
                    }
                }
                .frame(width: 200)
                .padding(5)
                
                
            }
            .navigationTitle("\(user.name == "" ? "write your name, child" : user.name)")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink("Go Nextz", destination: NavDestinationView())
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            //remember Ben 10 for envrio re-wire
            ContentView().environmentObject(User(name: "Content Creator", luckyNumber: 100))
        } else {
            // Fallback on earlier versions
        }
    }
}

/**
 --------------------------
 NOTES:
 //initial commit
 
 //@State private var presentModal is made to be bound to var in another file
 //@State private var number is made to be referenced & computed in same file
 
 //.sheet() facts:
 //if arbVar == true, below will gen a modal
 //dismissin whats inside dismisses sheet
 
 //alerts can't hold textfields in swiftUI
 
 //reading docs on swiftUI textfields
 //turns out the 14 lines of code used to generate the textfield alert in the MiniCoreDataChallenge in the default Swift can be replaced w 1 or 4 lines of code in SwiftUI
 > TextField(
 "Edit Your User Name",
 text: $user.name
 )
 //so now the name is updating fine, but I wanna do more w the focus and backgrd color
 //playing w focus options and binding said focus to @FocusState property up top
 
 //not sure if .environment(user) is necessary in latest version of Swift for                         ModalSheetView(isShowing: $presentModal)
 //in fact, it seems to get user passed automatically even though it's presenated (not in OG view hierarchy)
 //user passed w/out need for injection" and NOW even need for the .environmentObject(user) tag - WALLA - Thanks stack overflow
 --------------------------
 UPDATES & QUESTIONS:
 */
