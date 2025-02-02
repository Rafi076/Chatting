import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String reciverEmail;
  //final String reciverName;
  final String reciverID;

   ChatPage(
      {super.key, required this.reciverEmail,required this.reciverID }); // required this.reciverName

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {  // ✅ Correct condition
      await _chatService.sendMessage(reciverID, _messageController.text);
      _messageController.clear();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(reciverEmail), // we will use name-->  reciverName
      ),
      body: Column(
        children: [
          // display all the message
          Expanded(child: _buildMessageList(),
          ),

          // userinput
          _buildUserInput(),
        ],
      ),
    );
  }
 //built Message List
Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(stream: _chatService.getMessages(reciverID, senderID),
        builder: (context, snapshot){
      // error
          if (snapshot.hasError) {
            return const Text("Error loading messages");
          }


          // loading
          if(snapshot.connectionState ==  ConnectionState.waiting){
            return const Text("Loading..");
          }

          // retun list view
          return ListView(
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),

          );
        });
}

// build message item
Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data["message"]);  // ✅ Correct key

}

// build message input
Widget _buildUserInput(){
    return Row(
      children: [
        // textfield should take up most of the space
        Expanded(child: MyTextfield(
          controller: _messageController,
          hinText: "Type a message",
          obscureText: false,
        )),
        // send button
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.send))
      ],
    );
}
}
