//
//  ContentView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var user = User(name: "Noah", luckyNumber: 0)
    @State private var presentModal = false
//    @State private var showNameEditor = false
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
                    Button("New Name") {
                        //PULL UP A NEW MODAL TO CHANGE NAME?
                        
//                        self.showNameEditor = true
                        var textField = UITextField()
                        let alert = UIAlertController(title: "Change user name", message: "", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Change Name Now!", style: .default) { _ in
                            
                            self.user.name = textField.text ?? self.user.name
                        }
                        
                        alert.addTextField { alertTextField in
                            alertTextField.placeholder = "Change your username"
                            textField = alertTextField //now they're linked?
                        }
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    Button("Show Modal") {
                        presentModal = true
                    }
                    
                    .sheet(isPresented: $presentModal) {
                        ModalSheetView(user: self.user, isShowing: $presentModal)
                    }
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.blue)
                .cornerRadius(7)
            }
            .navigationTitle("\(user.name)")
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
 --------------------------
 UPDATES & QUESTIONS:
 */
