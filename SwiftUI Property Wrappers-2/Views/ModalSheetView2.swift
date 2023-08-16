//
//  ModalSheetView2.swift
//  SwiftUI Property Wrappers-2
//
//  Created by Noah Pope on 8/15/23.
//

import SwiftUI

struct ModalSheetView2: View {
    @ObservedObject var user: User
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("change da namez below")
                TextField(
                        "default text?",
                        text: "yo"
                    )
            }
        }
    }
    
}

struct ModalSheetView2_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView2(user: User(name: "KimPossible", luckyNumber: 0), isShowing: .constant(true))
    }
}
