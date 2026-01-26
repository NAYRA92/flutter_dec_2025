import 'package:flutter/material.dart';
import 'package:flutter_application_2912/app_theme.dart';
import 'package:flutter_application_2912/project_files/constants/apis.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

var chatModel = GenerativeModel(
  model: "gemini-2.5-flash",
  apiKey: "geminiAPIKEY",
  systemInstruction: Content.text(
    """When the user asks about a morning message, 
    give them one phrase with an emoji . 
    Make it motivational and only for engineers.
    You only answers about cars.""",
  ),
);

String chatText = "";

class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _chatMessage = TextEditingController();
  List<String> chatBotMessages = [];
  List<String> userMessagesList = [];

  Future<void> _generateChatResponse(String userMessage) async {
    final messageContent = Content.text(userMessage);
    final modelChat = chatModel.startChat();
    final modelResponse = await modelChat.sendMessage(messageContent);
    setState(() {
      chatText = modelResponse.text!;
      chatBotMessages.add(modelResponse.text!);
      userMessagesList.add(userMessage);
    });
    print(modelResponse.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: _chatMessage),
          SizedBox(height: 10,),
          kPrimaryButton("Send", () {
              _generateChatResponse(_chatMessage.text);
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: chatBotMessages.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                          color: kPrimaryColor.withAlpha(0x30),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )
                          ),
                          child: Text(userMessagesList[index])),
                      ),
                      SizedBox(height: 5,),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(5),
                           decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )
                          ),
                          child: Text(chatBotMessages[index])),
                      ),
                    ],
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}
