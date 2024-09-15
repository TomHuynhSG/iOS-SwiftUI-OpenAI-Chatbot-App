//
//  Message.swift
//  SwiftUI OpenAI ChatGPT
//
//  Created by Tom Huynh on 15/9/24.
//

import Foundation

// Message struct to represent each chat message
struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}
