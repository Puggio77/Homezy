//
//  CategoryViewModel.swift
//  homezy
//
//  Created by Riccardo Puggioni on 16/10/25.
//

import Foundation
import SwiftUI

let categories: [Category] = [
    .init(
        name: "Kitchen",
        icon: "fork.knife",
        color: .orange,
        description: "Tips and tasks to keep your kitchen clean and organized.",
        tips: [
            .init(title: "Clean the stove", details: "Wipe down the stovetop daily to remove grease."),
            .init(title: "Wash the dishes", details: "Do the dishes right after meals to avoid buildup."),
            .init(title: "Wipe the counters", details: "Disinfect kitchen surfaces to keep them germ-free.")
        ]
    ),
    .init(
        name: "Bathroom",
        icon: "shower",
        color: .blue,
        description: "Keep your bathroom fresh and sanitized.",
        tips: [
            .init(title: "Clean the sink", details: "Use a mild cleaner to remove stains and toothpaste marks."),
            .init(title: "Disinfect the toilet", details: "Use a toilet brush and disinfectant weekly."),
            .init(title: "Polish the mirror", details: "Use glass cleaner for a streak-free shine.")
        ]
    ),
    .init(
        name: "Bedroom",
        icon: "bed.double.fill",
        color: .purple,
        description: "Organize your room for a tidy and relaxing environment.",
        tips: [
            .init(title: "Make the bed", details: "Start your day by making your bed—it sets the tone for productivity."),
            .init(title: "Dust furniture", details: "Wipe surfaces with a microfiber cloth weekly."),
            .init(title: "Vacuum the floor", details: "Vacuum carpets and under the bed once a week.")
        ]
    ),
    .init(
        name: "Living Room",
        icon: "sofa.fill",
        color: .brown,
        description: "Keep your living room clean and cozy.",
        tips: [
            .init(title: "Organize shelves", details: "Keep decor neat and remove unnecessary items."),
            .init(title: "Clean the coffee table", details: "Wipe away fingerprints and stains daily."),
            .init(title: "Vacuum the carpet", details: "Vacuum twice a week to remove dust and debris.")
        ]
    ),
    .init(
        name: "Clothes",
        icon: "tshirt.fill",
        color: .pink,
        description: "Manage laundry and washing cycles.",
        tips: [
            .init(title: "Sort clothes", details: "Separate whites, colors, and delicates before washing."),
            .init(title: "Start washing cycle", details: "Choose the correct cycle for fabric type."),
            .init(title: "Fold laundry", details: "Fold and store clothes immediately after drying.")
        ]
    ),
    .init(
        name: "Office",
        icon: "laptopcomputer",
        color: .teal,
        description: "Maintain a clean and productive workspace.",
        tips: [
            .init(title: "Organize the desk", details: "Keep only essentials on your desk."),
            .init(title: "Clean the monitor", details: "Use a microfiber cloth to remove dust."),
            .init(title: "Empty the trash bin", details: "Empty it daily to avoid clutter.")
        ]
    ),
    .init(
        name: "Repair",
        icon: "wrench.and.screwdriver.fill",
        color: .yellow,
        description: "If there is anything that needs fixing, we've got you covered.",
        tips: [
            .init(title: "Replace lights", details: "Change burnt-out bulbs immediately."),
            .init(title: "Fix the sink", details: "Tighten or replace leaking parts."),
            .init(title: "Inspect tools", details: "Keep your toolkit clean and ready.")
        ]
    ),
    .init(
        name: "Schedule",
        icon: "calendar",
        color: .green,
        description: "Manage your day well.",
        tips: [
            .init(title: "Plan the week", details: "Set cleaning goals every Sunday."),
            .init(title: "Set reminders", details: "Use an app or planner for daily tasks."),
            .init(title: "Review progress", details: "Check what’s done and adjust your plan.")
        ]
    )
]

