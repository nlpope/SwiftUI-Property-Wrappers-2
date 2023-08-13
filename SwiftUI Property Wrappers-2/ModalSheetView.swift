//
//  ModalSheetView.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Stewart Lynch on 2020-07-25.
//

/**
 --------------------------
 NOTES:
 //.sheet is getting dismissed/dragged down in the background
 //but ModalSheetView is ours so we have to manually trigger its dismissal
 //@Binding var isShowing is made to be bound to @State var presentModal
 --------------------------
 UPDATES & QUESTIONS:
 */
import SwiftUI

struct ModalSheetView: View {
    @Binding var isShowing: Bool
    var number: Int = 11
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Lucky Number:")
                    Text("\(number)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                }
                Button("New Number") {
                    
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.purple)
                .cornerRadius(7)
            }
            .navigationTitle("Modal Sheet View")
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
        ModalSheetView(isShowing: .constant(true))
    }
}
