//
//  ModalSheetView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

import SwiftUI

@available(iOS 15.0, *)
struct ModalSheetView: View {
    @EnvironmentObject var user: User
    @Binding var isShowing: Bool

    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number:")
                    Text("\(user.luckyNumber)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                }
                Button("New Number") {
                    user.luckyNumber = Int.random(in: 11...20)
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.purple)
                .cornerRadius(7)
                
              
            }
            .navigationTitle("\(user.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Dismiss") {
                        isShowing = false
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

struct ModalSheetView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ModalSheetView(isShowing: .constant(true)).environmentObject(User(name: "Modok", luckyNumber: 616))
//            ModalSheetView(user: User(name: "Modok", luckyNumber: 200), isShowing: .constant(true))
        } else {
            // Fallback on earlier versions
        }
    }
}

/**
 --------------------------
 NOTES:
 //.sheet is getting dismissed/dragged down in the background
 //but ModalSheetView is ours so we have to manually trigger its dismissal
 //@Binding var isShowing is made to be bound to @State var presentModal
 
 //b/c self.number is bound to the @State number var in ContentView,
 the update happens as soon as "New Number" button is pressed here
 
 //@ObservedObject var user: User needs no binding '$' on the other end
 --------------------------
 UPDATES & QUESTIONS:
 //Text("\(user.luckyNumber)")
 why wasn't above working til I flat out replaced it w an identical?

 //correction - removing focus state from modalSheetView - unnecessary
 */
