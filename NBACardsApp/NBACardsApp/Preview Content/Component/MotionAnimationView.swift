//
//  MotionAnimationView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/10/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //Properties
    
    @State private var randomCircle: Int = Int.random(in: 6...12);
    @State private var isAnimating: Bool = false;

    
    
    //Functions:
    
    //Random coordinate
    func randomCoord() -> CGFloat {
        return CGFloat.random(in: 0...256);
    }
    //random size
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    //random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //random speed
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.005...1.0)
    }
    //random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id:\.self){ item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .position(
                        x: randomCoord(),
                        y: randomCoord()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(
                        perform:{
                            withAnimation(
                                .interpolatingSpring(
                                    stiffness: 0.25,
                                    damping:0.25).repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                            ){
                                isAnimating = true;
                            }
                        }
                    )
                    .frame(width: randomSize())
            }
        }
        .frame(width: 300, height: 300)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView().background(
            Circle()
                .fill(.teal)
                .frame(width: 300,height: 300))
    }
}
