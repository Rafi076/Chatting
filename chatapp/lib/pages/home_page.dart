import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_Page.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Chat & Auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CHAT LIST"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // Build a list of users except for the currently logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading users"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No users available"));
        }

        // ✅ Get the current user properly
        final currentUser = _authService.getCurrentUser();
        final String currentUserId = currentUser?.uid ?? "";

        // ✅ Debugging
        print("Current User: $currentUser");
        print("Current User ID: $currentUserId");

        // ✅ Filter out the current user from the list
        List filteredUsers = snapshot.data!
            .where((user) => user["uid"] != currentUserId)
            .toList();

        if (filteredUsers.isEmpty) {
          return const Center(child: Text("No other users available"));
        }

        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            var user = filteredUsers[index];
            return _buildUserListItem(user, context);
          },
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciverEmail: userData["email"],
                //reciverName: userData["name"],
                reciverID: userData["uid"]
              ),
            ),
          );
        },
      );
    }
    else{
      return Container();
    }
  }
}
