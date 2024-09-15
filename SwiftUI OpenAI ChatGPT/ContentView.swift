//
//  ContentView.swift
//  SwiftUI OpenAI ChatGPT
//
//  Created by Tom Huynh on 15/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var messages: [Message] = [
        Message(content: "Ask me anything!", isUser: false)
    ]
    
    let chatAPI = ChatGPTAPI(apiKey: "enter-your-api-key-here")  // Replace with your actual API key
    
    var body: some View {
        VStack {
            Text("Chat with AI")
                .font(.largeTitle)
                .padding()
            
            // Expanded ScrollView to use more screen space
            ScrollView {
                ForEach(messages) { message in
                    HStack {
                        if message.isUser {
                            Spacer()
                            Text(message.content)
                                .padding()
                                .background(Color.blue.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .frame(maxWidth: 300, alignment: .trailing)
                        } else {
                            Text(message.content)
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                                .frame(maxWidth: 300, alignment: .leading)
                            Spacer()
                        }
                    }
                    .padding(5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up all available space
            .padding(.horizontal)

            // Input field and button at the bottom
            HStack {
                TextField("Enter your message", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.trailing)
            }
            .padding(.bottom, 10)
        }
        .padding(.top)
    }
    
    func sendMessage() {
        // Add user's message to the messages array
        let userMessage = Message(content: userInput, isUser: true)
        messages.append(userMessage)
        
        // Clear the input field
        userInput = ""
        
        // Call the ChatGPT API
        chatAPI.sendMessage(message: userMessage.content) { response in
            DispatchQueue.main.async {
                if let response = response {
                    // Add the assistant's response to the messages array
                    let assistantMessage = Message(content: response, isUser: false)
                    messages.append(assistantMessage)
                } else {
                    // In case of error, show a message
                    let errorMessage = Message(content: "Sorry, something went wrong.", isUser: false)
                    messages.append(errorMessage)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
