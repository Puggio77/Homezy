//
//  TipDetailView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 16/10/25.
//

import SwiftUI

struct TipDetailView: View {
    let tip: Tip
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .fill(color.gradient)
                .frame(height: 120)
                .overlay(
                    VStack {
                        Image(systemName: "lightbulb.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text(tip.title)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 10)
            
            Text(tip.details)
                .font(.body)
                .foregroundColor(.primary)
                .padding()
            
            Spacer()
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    TipDetailView(
        tip: Tip(title: "Clean the stove", details: "Wipe down the stovetop daily to remove grease."),
        color: .orange
    )
}
