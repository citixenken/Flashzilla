//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ken Muyesu on 04/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = [Card] (repeating: Card.example, count: 10)
    
    var body: some View {
//        Text("FlashZilla")
//            .padding()
//        CardView(card: Card.example)
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, total: cards.count)
                    }
                }
            }
        }
    }
}

extension View {
    func stacked(at position: Int, total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
