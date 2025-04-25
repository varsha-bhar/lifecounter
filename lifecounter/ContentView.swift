//
//  ContentView.swift
//  lifecounter
//
//  Created by Varsha Bharath on 4/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var playerLives = Array(repeating: 20, count: 4)
    @State private var showInput = [false, false, false, false]
    @State private var isAdding = [true, true, true, true]
    @State private var inputAmounts = ["", "", "", ""]
    @State private var history: [String] = []
    
    private var gameStarted: Bool {
        playerLives.contains(where: { $0 != 20 })
    }
        
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(playerLives.indices, id: \.self) { index in
                        VStack(spacing: 10) {
                            Text("Player \(index + 1)").font(.system(size: 24))
                            
                            Text(playerLives[index] > 0 ? "\(playerLives[index])" : "DEAD")
                                .font(.system(size: 32))
                                .foregroundColor(playerLives[index] > 0 ? .black : .red)
                            
                            VStack {
                                HStack(spacing: 10) {
                                    Button("Remove") {
                                        isAdding[index] = false
                                        showInput[index] = true
                                    }
                                    
                                    Button("-") {
                                        playerLives[index] = max(0, playerLives[index] - 1)
                                        history.append("Player \(index + 1) lost one life.")
                                    }
                                    Button("+") {
                                        playerLives[index] += 1
                                        history.append("Player \(index + 1) gained one life.")
                                    }
                                    
                                    Button("Add") {
                                        isAdding[index] = true
                                        showInput[index] = true
                                    }
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(playerLives[index] <= 0)
                            
                            if showInput[index] {
                                HStack {
                                    TextField("Amount", text: $inputAmounts[index])
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 80)
                                    
                                    Button("OK") {
                                        if let amount = Int(inputAmounts[index]) {
                                            let verb = isAdding[index] ? "gained" : "lost"
                                            let change = isAdding[index] ? amount : -amount
                                            let actualChange = isAdding[index] ? amount : min(amount, playerLives[index])
                                                                                
                                            playerLives[index] = max(0, playerLives[index] + change)
                                            history.append("Player \(index + 1) \(verb) \(actualChange) life.")
                                        }
                                        inputAmounts[index] = ""
                                        showInput[index] = false
                                    }
                                }
                            }
                            
                            if playerLives[index] <= 0 {
                                Text("Player \(index + 1) LOSES!").foregroundColor(.red).font(.title3)
                            }
                            Divider().padding(.vertical, 10)
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    Button("Add Player") {
                        if playerLives.count < 8 {
                            playerLives.append(20)
                            showInput.append(false)
                            isAdding.append(true)
                            inputAmounts.append("")
                    }
                    }
                    .disabled(playerLives.count >= 8 || gameStarted)
                                
                    Button("Remove Player") {
                        if playerLives.count > 2 {
                                playerLives.removeLast()
                                showInput.removeLast()
                                isAdding.removeLast()
                                inputAmounts.removeLast()
                            }
                    }
                    .disabled(playerLives.count <= 2 || gameStarted)
                }
                .padding()
                
                NavigationLink(destination: HistoryView(history: history)) {
                    Text("History")
                        .padding().frame(maxWidth:.infinity)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing, .bottom])
            }
            .padding()
            .navigationTitle("LifeCounter")
        }
    }
}

#Preview {
    ContentView()
}

