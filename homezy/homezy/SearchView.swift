//
//  SearchView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    let categories: [Category] = [
        .init(name: "Kitchen", icon: "fork.knife", color: .orange, description: "Tips and tasks to keep your kitchen clean and organized."),
        .init(name: "Bathroom", icon: "shower", color: .blue, description: "Keep your bathroom fresh and sanitized."),
        .init(name: "Bedroom", icon: "bed.double.fill", color: .purple, description: "Organize your room for a tidy and relaxing environment."),
        .init(name: "Living Room", icon: "sofa.fill", color: .green, description: "Keep your living room clean and cozy."),
        .init(name: "Clothes", icon: "tshirt.fill", color: .pink, description: "Manage laundry and washing cycles."),
        .init(name: "Office", icon: "laptopcomputer", color: .teal, description: "Maintain a clean and productive workspace."),
        .init(name: "Repair" , icon:"wrench.and.screwdriver.fill", color: .yellow , description: "If there is anything that needs fixing, we've got you covered."),
    ]
    
    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    Text("Categories")
                        .font(.title2.bold())
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredCategories) { category in
                            NavigationLink(value: category) {
                                CategoryTile(category: category)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Category.self) { category in
                CategoryDetailView(category: category)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search rooms or tasks...", text: $text)
                .textFieldStyle(.plain)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CategoryTile: View {
    let category: Category
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(category.color.gradient)
                .frame(height: 120)
            
            VStack(alignment: .leading, spacing: 6) {
                Image(systemName: category.icon)
                    .font(.title2)
                Text(category.name)
                    .font(.headline)
            }
            .foregroundColor(.white)
            .padding()
        }
        .shadow(radius: 2)
    }
}

#Preview {
    SearchView()
}
