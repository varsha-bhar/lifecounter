
//
//  HistoryView.swift
//  lifecounter
//
import SwiftUI

struct HistoryView: View {
    let history: [String]

    var body: some View {
        List(history.reversed(), id: \.self) { entry in
            Text(entry)
        }
        .navigationTitle("History")
    }
}


