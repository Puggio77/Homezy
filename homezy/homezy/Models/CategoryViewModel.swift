//
//  CategoryViewModel.swift
//  homezy
//
//  Created by Riccardo Puggioni on 16/10/25.
//

import Foundation
import SwiftUI

let categories: [Category] = [
    .init(name: "Kitchen", icon: "fork.knife", color: .orange, description: "Tips and tasks to keep your kitchen clean and organized."),
    .init(name: "Bathroom", icon: "shower", color: .blue, description: "Keep your bathroom fresh and sanitized."),
    .init(name: "Bedroom", icon: "bed.double.fill", color: .purple, description: "Organize your room for a tidy and relaxing environment."),
    .init(name: "Living Room", icon: "sofa.fill", color: .brown, description: "Keep your living room clean and cozy."),
    .init(name: "Clothes", icon: "tshirt.fill", color: .pink, description: "Manage laundry and washing cycles."),
    .init(name: "Office", icon: "laptopcomputer", color: .teal, description: "Maintain a clean and productive workspace."),
    .init(name: "Repair" , icon:"wrench.and.screwdriver.fill", color: .yellow , description: "If there is anything that needs fixing, we've got you covered."),
    .init(name: "Schedule", icon: "calendar", color: .green, description: "Manage your day Well")
]
