import 'package:chatapp/themes/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    // light vs dark mode for correct bubble color
    bool isDarkmode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(

        color: isCurrentUser?
              (isDarkmode? Colors.green.shade600 : Colors.green.shade500)
            : (isDarkmode? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
      child: Text(message, style: TextStyle(color: isCurrentUser? Colors.white : (isDarkmode? Colors.white : Colors.black)),),
    );
  }
}
