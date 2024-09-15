//
//  ChatGPTAPI.swift
//  SwiftUI OpenAI ChatGPT
//
//  Created by Tom Huynh on 15/9/24.
//

import SwiftUI

struct ChatGPTAPI {
    let apiKey: String  // API key for authentication

    // Sends a message to the API and returns the response via a completion handler
    func sendMessage(message: String, completion: @escaping (String?) -> Void) {
        // API endpoint URL for sending chat completions
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        
        // Create a POST request to the API
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set authorization and content type headers
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Define the request body with the model and messages
        let body: [String: Any] = [
            "model": "gpt-4o-mini",  // Specify the model to use (adjust as needed)
            "messages": [
                ["role": "system", "content": "You are a helpful assistant."],  // System message
                ["role": "user", "content": message]  // User message to send
            ]
        ]
        
        // Convert the body to JSON data
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // Perform the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for successful response and parse JSON
            guard let data = data, error == nil else {
                completion(nil)  // Return nil if there's an error
                return
            }
            
            // Parse JSON to extract the response message
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let choices = json["choices"] as? [[String: Any]],
               let message = choices.first?["message"] as? [String: Any],
               let content = message["content"] as? String {
                completion(content)  // Return the content of the message
            } else {
                completion(nil)  // Return nil if parsing fails
            }
        }.resume()  // Start the network request
    }
}
