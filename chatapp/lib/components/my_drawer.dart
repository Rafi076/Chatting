import 'package:chatapp/pages/messageRequest_page.dart';
import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../pages/archive_Page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    // get auth service
    final auth = AuthService();
    auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.drag_indicator_sharp,
                      color: Theme.of(context).colorScheme.primary,
                      size: 50,
                    ),
                  )
              ),

              //Home list tile
              Padding(
                padding: const EdgeInsets.only(left : 25),
                child: ListTile(
                  title: Text("C H A T"),
                  leading: Icon(Icons.mark_unread_chat_alt_outlined),
                  onTap: (){
                    // pop the Drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 25),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                  onTap: (){
                    // push to settings page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 25),
                child: ListTile(
                  title: Text("R E Q U E S T S"),
                  leading: Icon(Icons.messenger_outline),
                  onTap: (){
                    // push to request page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MessagerequestPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 25),
                child: ListTile(
                  title: Text("A R C H I V E"),
                  leading: Icon(Icons.archive),
                  onTap: (){
                    // push to Archive page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ArchivePage()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left : 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: logout
            ),
          ),


          // settings

          // logout
        ],
      ),
    );
  }
}