# SwiftUI OpenAI Chatbot App

<p align="center">
  <img width="250" src="https://i.imgur.com/4aNAcED.jpeg">
</p>


## 📖 Description

- A simple SwiftUI example app with a chatbot interface integrating OpenAI API call without any external package!

 <p align="center">
  <img src="https://i.imgur.com/DHu7D8c.png" height="600" > 
</p>

- Add your OpenAI API Key:

  - Navigate to the ChatGPTAPI.swift file.
  - Replace the placeholder let apiKey: String with your actual API key:
`let apiKey = "your-api-key-here"`




## 🔧 Build Information
- Xcode 15.4
- SwiftUI Framework
- Target Deployment iOS >=17.5

## 🔑 The API Request Information
You can change these information accordingly if OpenAI happens to change their endpoint or model names in the future:

- **Endpoint**: https://api.openai.com/v1/chat/completions
- **Model**: gpt-4o-mini (can be adjusted as needed)
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

## 🏆 Author
- Huynh Nguyen Minh Thong (Tom Huynh) - tomhuynhsg@gmail.com
