//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ken Muyesu on 04/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        Text("FlashZilla")
//            .padding()
        CardView(card: Card.example)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
