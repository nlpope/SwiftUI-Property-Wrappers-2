//
//  ContentView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

/**
 --------------------------
 NOTES:
 //initial commit
 
 //@State private var presentModal is made to be bound to var in another file
 //@State private var number is made to be referenced & computed in same file

 //.sheet() facts:
 //if arbVar == true, below will gen a modal
 //dismissin whats inside dismisses sheet
 --------------------------
 UPDATES & QUESTIONS:
 */

import SwiftUI

struct ContentView: View {
    @State var presentModal = false
    var number = 11
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number:")
                    Text("\(number)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                }
                Group {
                    Button("New Number") {
                        
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
                .background(Color.blue)
                .cornerRadius(7)
            }
            .navigationTitle("Property Wrappers 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Text("Go Next")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
