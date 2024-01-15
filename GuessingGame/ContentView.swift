//
//  ContentView.swift
//  GuessingGame
//
//  Created by ahmad kaddoura on 1/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countryFlags = ["Estonia", "France", "Germany","Ireland","Nigeria","Poland","Spain","United Kingdom","Ukraine","USA"].shuffled()
    
    @State private var answer = Int.random(in:0...2)
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var finalScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue,Color.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Spacer()
                VStack{
                    Text("Flag of:")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Text(countryFlags[answer])
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                        
                }
                ForEach(0..<3){number in
                    Spacer()
                    Button{
                        flagTapped(number)
                    }label:{
                        Image(countryFlags[number])
                    }
                }
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.bold))
                .padding()
                Spacer()
            }
            .alert(scoreTitle, isPresented:$showScore){
                Button("Continue") {
                    newQuestion()
                }
            }message: {
                Text("Your Final Score is \(finalScore)")
            }
        }
        
    }
    
    func flagTapped(_ number: Int){
        if number == answer{
            scoreTitle = "Correct that's \(countryFlags[number])"
            score += 100
            showScore = false
            newQuestion()
        }else{
            scoreTitle = "Wrong that's \(countryFlags[number])"
            finalScore = score
            score = 0
            showScore = true
        }
    }
    
    func newQuestion(){
        countryFlags.shuffle()
        answer = Int.random(in:0...2)
    }
    
    func resetScore(){
        score = 0
    }
}

#Preview {
    ContentView()
}
