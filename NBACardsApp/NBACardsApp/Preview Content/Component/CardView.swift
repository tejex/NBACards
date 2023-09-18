//
//  CardView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/5/23.
//

import SwiftUI

struct CardView: View {
    
    @State private var images = ["Anthony Davis","Damian Lillard","Demar Derozan","Klay Thompson","Lebron James"];
    @State private var currentImage = "Lebron James";
    
    @State private var randomNum: Int = 1;
    @State private var imageNum: Int = 1;
    @State private var count = 0;
    @State private var showAlert = false;
    
    //ensuring the same random number is not generated
    func randNum(){
        repeat {
            randomNum = Int.random(in: 0...images.count-1)
        } while randomNum == imageNum
        imageNum = randomNum;
        currentImage = images[imageNum]
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
                .padding(30)
                .frame(width: 430,height: 780)
            VStack {
                // Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("NBA Players")
                            .fontWeight(.black)
                            .font(.system(size: 42))
                            .foregroundStyle(LinearGradient(
                                colors:[
                                    .black,
                                    .customGrayMedium],
                                startPoint: .top,
                                endPoint: UnitPoint.bottom))
                    }
                    .padding(20)
                    Text("Checkout your favorite NBA Players and some of their Impressive Stats")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .italic()
                        .padding(10)
                }
                .padding(.horizontal, 30)
                //Main content
                ZStack {
                    CustomCircleView()
                    Image(currentImage)
                        .resizable()
                        .frame(width: 210,height: 210)
                        .animation(.easeOut(duration: 0.7), value: imageNum)
                        .cornerRadius(70)
                }
                //Footer Content
                VStack {
                    HStack {
                        Button{
                            randNum()
                        }label: {
                            Text("Random")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundStyle(LinearGradient(
                                    colors:[
                                        .customGreenLight,
                                        .customGreenMedium],
                                    startPoint: .top,
                                    endPoint: .bottom))
                        }
                        .buttonStyle(GradientButton())
                        Button{
                            if(count==images.count-1){
                                count = 0;
                                currentImage = images[count];
                            }
                            else{
                                count = count + 1;
                                currentImage = images[count];
                            }
                        }label: {
                            Text("Next")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundStyle(LinearGradient(
                                    colors:[
                                        .customGreenLight,
                                        .customGreenMedium],
                                    startPoint: .top,
                                    endPoint: .bottom))
                        }
                    .buttonStyle(GradientButton())
                    }
                    HStack {
                        Button{
                            self.showAlert = true;
                        }label: {
                            Text("View Player Stats")
                        }
                        .frame(width: 200,height: 40)
                        .background(LinearGradient(
                            colors:[
                                .customGrayLight,
                                .customGrayMedium],
                            startPoint: .top,
                            endPoint: .bottom))
                        .cornerRadius(40)
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenLight)
                    }
                    .sheet(isPresented: $showAlert){
                        StatsView(currentPlayer: $currentImage)
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
