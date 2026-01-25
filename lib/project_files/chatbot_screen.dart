import 'package:flutter/material.dart';
import 'package:flutter_application_2912/project_files/constants/apis.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

var chatModel = GenerativeModel(
  model: "gemini-2.5-flash",
  apiKey: geminiAPIKEY,
  systemInstruction: Content.text(
    """When the user asks about a morning message, 
    give them one phrase with an emoji . 
    Make it motivational and only for engineers.
    You only answers about cars."""
  )
);



class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _chatMessage = TextEditingController();

  Future<void> _generateChatResponse () async {
    final messageContent = Content.text("Give Me A Morning Msg.");
    final modelChat = chatModel.startChat();
    
    final modelResponse = await modelChat.sendMessage(messageContent);
    print(modelResponse.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _chatMessage ,
          ),
          ElevatedButton(
            onPressed: _generateChatResponse, 
            child: Text("Send")),
          Text("")
        ],
      ),
    );
  }
}