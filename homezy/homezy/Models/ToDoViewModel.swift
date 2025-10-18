//
//  ToDoViewModel.swift
//  homezy
//
//  Created by Riccardo Puggioni on 18/10/25.
//

import Foundation
import SwiftUI

let todo: [ToDo] = [
    .init(
        title: "Fold Clothes",
        icon: "tshirt.fill",
        detail: "Time to tidy up! Please fold and put away all the clean clothes in your wardrobe. Once done, mark this challenge as complete to earn your reward!"
    ),
    .init(
        title: "Wash dishes",
        icon: "dishwasher.fill",
        detail: "Don't leave them for tomorrow! Wash all the dishes, cutlery, and cookware currently in the sink or dishwasher. Ready to conquer the grime?"
    ),
    .init(
        title: "Clean bathroom",
        icon: "shower.fill",
        detail: "A clean bathroom is a happy bathroom. Wipe down all surfaces, clean the mirror, and sanitize the sink and toilet.Complete this challenge for a sparkling space!"
    ),
    .init(
        title: "Clean the office",
        icon: "lamp.desk.fill",
        detail: "Focus requires a clean desk! Organize your documents, wipe your desk, and clear out any clutter.** Finish this task and enjoy your productive zone."
    ),
    .init(
        title: "Change the blankets",
        icon: "bed.double.fill",
        detail: "Fresh sheets feel amazing! Remove the old blankets and put on a fresh set.** Make your bed and confirm completion below!"
    )
]
