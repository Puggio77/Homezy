//
//  CategoryDetailView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//

import SwiftUI

struct CategoryDetailView: View {
    
    let category: Category
    @State private var selectedTip: Tip? = nil
    @State private var showTipDetail: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                //MARK: - CATEGORY RECTANGLE
                RoundedRectangle(cornerRadius: 20)
                    .fill(category.color.gradient)
                    .frame(height: 160)
                    .overlay(
                        VStack {
                            Image(systemName: category.icon)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text(category.name)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                        }
                    )
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(category.description)
                    .font(.body)
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                
                Divider().padding(.horizontal)
                
                //MARK: - SUGGESTED TIPS PART
                Text("Suggested Tips")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                VStack(spacing: 12) {
                    ForEach(category.tips) { tip in
                        Button {
                            // ✅ Quando premi un tip, apri overlay
                            selectedTip = tip
                            showTipDetail = true
                        } label: {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                                .frame(height: 70)
                                .overlay(
                                    HStack {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.blue)
                                        Text(tip.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal)
                                )
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        
        //Overlay x suggested tips
        .sheet(item: $selectedTip) { tip in
            TipDetailView(tip: tip, color: category.color)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    NavigationView {
        CategoryDetailView(category: categories[0])
    }
}
