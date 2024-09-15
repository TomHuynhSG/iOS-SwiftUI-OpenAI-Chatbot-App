# SwiftUI OpenAI Chatbot App

<p align="center">
  <img width="250" src="https://i.imgur.com/4aNAcED.jpeg">
</p>


## 📖 Description

- This is a simple chat application built using SwiftUI that integrates with OpenAI's ChatGPT API without any external package!
- The app allows users to have a conversation with the OpenAI language model (ChatGPT) directly within the app.
- The messages are stored and displayed in a scrollable view, and the app supports a continuous conversation where both the user's and the assistant's messages are remembered.

<p align="center">
  <img src="https://i.imgur.com/DHu7D8c.png" height="600" > 
</p>

## Features
- Send text-based prompts to OpenAI's ChatGPT API.
- Display a conversation history with user and assistant messages.
- Automatically scrolls to the most recent message.
- Responsive layout optimized for iOS devices using SwiftUI.


## 🔑 The API Request Information
You can change these information accordingly if OpenAI happens to change their endpoint or model names in the future:
- **Add your OpenAI API Key**:
  - Navigate to the ChatGPTAPI.swift file.
  - Replace your_api_key_here with your actual API key from OpenAI:
`let apiKey = "your-api-key-here"`


- **Endpoint**: https://api.openai.com/v1/chat/completions
- **Model**: gpt-4o-mini (can be adjusted as needed). You can easily switch between different OpenAI models by changing the model name in the ChatGPTAPI struct. For example, you can use "gpt-4", "gpt-3.5-turbo", or any other model available to your OpenAI account.
- **Headers**:
  - `Authorization`: Bearer token using your API key.
  - `Content-Type`: `application/json`
- **Request Body**:

```json
{
  "model": "gpt-4o-mini",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Your message here"}
  ]
}
```

## 🔧 Build Information
- Xcode 15.4
- SwiftUI Framework
- Target Deployment iOS >=17.5

## 🔮 Future Improvements
- **Message Persistence**: Implement Core Data or another local database solution to save the conversation even after the app is closed.
- **Better Error Handling**: Add UI to handle errors such as invalid API keys, network issues, or API rate limits.
- **Message Retry**: Add a "retry" button if the API call fails.
- **Enhance UI**: Add better visuals, animations, and user interface enhancements.

## 🏆 Author
- Huynh Nguyen Minh Thong (Tom Huynh) - tomhuynhsg@gmail.com
