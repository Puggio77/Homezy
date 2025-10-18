//
//  Tip.swift
//  homezy
//
//  Created by Riccardo Puggioni on 16/10/25.
//

import Foundation
import SwiftUI

struct Tip: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let details: String
}

