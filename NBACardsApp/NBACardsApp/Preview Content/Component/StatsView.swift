//
//  StatsView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/14/23.
//

import SwiftUI

struct StatsView: View {
    
    @Binding var currentPlayer: String;
    @State private var fakeList = [
        "NBA Champion",
        "MVP",
        "ALL Star",
        "All NBA",
        "All Defense",
        "ROY",
        "Scoring Champ",
        "Finals MVP",
        "Gold Medal",
    ]

    var body: some View {
        VStack {
            HStack {
                Image(currentPlayer)
                    .resizable()
                    .frame(width: 140,height:140)
                    .cornerRadius(150)
                Text(currentPlayer)
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .frame(width: 370, height: 130)
            .background(LinearGradient(
                colors:[
                    .customGrayLight,
                    .customGrayMedium],
                startPoint: .top,
                endPoint: .bottom))
            .cornerRadius(10)
            .fontWeight(.heavy)
            .foregroundColor(.customGreenLight)
        }

        VStack{
            Text("About The Player")
                .fontWeight(.heavy)
                .foregroundColor(.black)
//                .padding(.horizontal,8)
//                .padding(.bottom,3)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy")
        }
        .frame(width: 370, height: 145)
        .background(LinearGradient(
            colors:[
                .customGreenLight,
                .customGreenLight],
            startPoint: .top,
            endPoint: .bottom))
        .cornerRadius(10)
        .foregroundColor(.black)
        List {
            Section(
                header: Text("Accomplishments"),
                footer:
                    HStack {
                    Spacer()
                    Text("Copyright © All rights reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            )
            {
                VStack(spacing: 0) {
                    ScrollView {
                        ForEach(fakeList, id: \.self){word in
                            LabeledContent{
                                Text("Test")
                                    .foregroundColor(.primary)
                            } label:{
                                Text(word)
                            }
                            .padding(.top,3)
                            .padding(.bottom,3)
                            }
                        }
                    }
                .background(.white)
            }
        }
        .background(.white)
        .frame(width: 370, height: 400)
        .cornerRadius(10)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(currentPlayer: .constant(""))
    }
}
