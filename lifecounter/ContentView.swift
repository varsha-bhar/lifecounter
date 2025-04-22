//
//  ContentView.swift
//  lifecounter
//
//  Created by Varsha Bharath on 4/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var player1Lives = 20
    @State private var player2Lives = 20
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HStack {
                    
                    Spacer()

                    VStack {
                        Text("Player 1").font(.system(size:30)).padding(.bottom, 5)
                        
                        if player1Lives > 0 {
                            Text("\(player1Lives)").font(.system(size: 40))
                        }
                        else {
                            Text("DEAD").font(.system(size: 40)).foregroundColor(.red)
                        }
                        
                        HStack(alignment: .center, spacing: 5) {
                            Button("-5") { self.player1Lives -= 5 }
                            Button("-") { self.player1Lives -= 1 }
                            Button("+") { self.player1Lives += 1 }
                            Button("+5") { self.player1Lives += 5 }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(player1Lives <= 0)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Player 2").font(.system(size:30)).padding(.bottom, 5)
                        
                        if player2Lives > 0 {
                            Text("\(player2Lives)").font(.system(size: 40))
                        }
                        else {
                            Text("DEAD").font(.system(size: 40)).foregroundColor(.red)
                        }
                        
                        HStack(alignment: .center, spacing: 5) {
                            Button("-5") { self.player2Lives -= 5 }
                            Button("-") { self.player2Lives -= 1 }
                            Button("+") { self.player2Lives += 1 }
                            Button("+5") { self.player2Lives += 5 }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(player2Lives <= 0)
                    }
                    
                    Spacer()

                }
                
                Spacer()
                
                if player1Lives <= 0 {
                    Text("Player 1 LOSES!")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 10)
                }
                else if player2Lives <= 0 {
                    Text("Player 2 LOSES!")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

