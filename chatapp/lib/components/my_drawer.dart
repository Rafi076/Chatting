import 'package:chatapp/pages/messageRequest_page.dart';
import 'package:chatapp/pages/settings_page.dart';
import 'package:chatapp/pages/archive_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthService _authService = AuthService();
  String? userName; // Store the user's name

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  // Fetch the logged-in user's name
  void _fetchUserName() async {
    final user = _authService.getCurrentUser();
    if (user != null) {
      final docSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();

      if (docSnapshot.exists) {
        setState(() {
          userName = docSnapshot.data()?['name'] ?? "User"; // Default to "User"
        });
      }
    }
  }

  // Logout function
  void logout() {
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.drag_indicator_sharp,
                          color: Theme.of(context).colorScheme.primary, size: 50),
                      const SizedBox(width: 10),
                      userName == null
                          ? const CircularProgressIndicator()
                          : Text(
                        userName!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Navigation List Tiles
              _buildListTile(
                title: "C H A T",
                icon: Icons.mark_unread_chat_alt_outlined,
                onTap: () => Navigator.pop(context),
              ),
              _buildListTile(
                title: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                ),
              ),
              _buildListTile(
                title: "R E Q U E S T S",
                icon: Icons.messenger_outline,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagerequestPage()),
                ),
              ),
              _buildListTile(
                title: "A R C H I V E",
                icon: Icons.archive,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArchivePage()),
                ),
              ),
            ],
          ),

          // Logout Button
          _buildListTile(
            title: "L O G O U T",
            icon: Icons.logout,
            onTap: logout,
          ),
        ],
      ),
    );
  }

  // Helper function to create ListTiles
  Widget _buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
