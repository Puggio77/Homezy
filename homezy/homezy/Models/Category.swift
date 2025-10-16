//
//  Category.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//

import Foundation
import SwiftUI

struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let description: String
    let tips: [Tip] 
}
