//
//  CategoryDetailView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//

import SwiftUI

struct CategoryDetailView: View {
    
    let category: Category
    @State var isModalOpen: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
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
                
                Text("Suggested Tips")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                VStack(spacing: 12) {
                    ForEach(sampleTasks(for: category), id: \.self) { task in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                            .frame(height: 70)
                            .overlay(
                                HStack {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.blue)
                                    Text(task)
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding(.horizontal)
                            )
                            .padding(.horizontal)
                    }
                }
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

func sampleTasks(for category: Category) -> [String] {
    switch category.name {
    case "Kitchen": return ["Clean the stove", "Wash the dishes", "Wipe the counters"]
    case "Bathroom": return ["Clean the sink", "Disinfect the toilet", "Polish the mirror"]
    case "Bedroom": return ["Make the bed", "Dust furniture", "Vacuum the floor"]
    case "Living Room": return ["Organize shelves", "Clean the coffee table", "Vacuum the carpet"]
    case "Laundry": return ["Sort clothes", "Start washing cycle", "Fold laundry"]
    case "Office": return ["Organize the desk", "Clean the monitor", "Empty the trash bin"]
    case "Repair": return ["replace lights", "repair the sink", "fanculo non so che scrivere"]
    default: return ["General cleaning", "Tidy up items"]
    }
}

#Preview {
    CategoryDetailView(category: Category(name: "Kitchen", icon: "fork.knife", color: .orange, description: "Tips and tasks to keep your kitchen clean and organized."))
}
