//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ken Muyesu on 04/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    //how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    //whether its currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        
        //updates offset and dragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        //long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
                
            }
        
        //combo gesture that allows user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 2.5 : 1)
            .offset(offset)
            .gesture(combined)
        
        //        VStack {
        //            Text("Hello, CK!")
        //                .onTapGesture {
        //                    print("Text tapped!")
        //                }
        //        }
        //        .simultaneousGesture(
        //            TapGesture()
        //                .onEnded {_ in
        //                    print("VStack tapped!")
        //
        //                }
        //        )
        
        
        //            .rotationEffect(currentAmount + finalAmount)
        //            .gesture(
        //                RotationGesture()
        //                        .onChanged { angle in
        //                            currentAmount = angle
        //                        }
        //                        .onEnded { angle in
        //                            finalAmount += currentAmount
        //                            currentAmount = .zero
        //                        }
        //            )
        
        
        //            .scaleEffect(finalAmount + currentAmount)
        //            .gesture(
        //                MagnificationGesture()
        //                    .onChanged { amount in
        //                        currentAmount = amount - 1
        //                    }
        //                    .onEnded { amount in
        //                        finalAmount += amount
        //                        currentAmount = 0
        //                    }
        //            )
        
        //            .onTapGesture(count: 3){
        //                print("Triple Tapped!")
        //            }
        //            .onLongPressGesture(minimumDuration: 1) {
        //                print("Long pressed!")
        //            } onPressingChanged: { inProgress in
        //                print("In progress: \(inProgress)")
        //            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
