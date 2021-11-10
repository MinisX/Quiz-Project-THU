import 'package:crew_brew/models/user/UserData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  String userName = 'test';
  String userEmail = 'test';
  String avatar = 'default.png';

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData?>(context);
    if(userData != null){
      userName = userData.username;
      userEmail = userData.email;
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/menu_images/$avatar',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/menu_images/userBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text('My profile'),
            onTap: () => selectedItem(context, 'userProfile'),
          ),
          ListTile(
            leading: Icon(Icons.archive),
            title: Text('My quizzes'),
            onTap: () => selectedItem(context, 'myQuizes'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Shared quizzes'),
            // TODO Redirect to shared quizzes page
            onTap: () => null,
          ),
          Divider(
            color: Colors.grey[500],
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Information'),
            // TODO Redirect to information page
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // TODO Redirect to settings page
            onTap: () => null,
          ),
          Divider(
            color: Colors.grey[500],
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => selectedItem(context, ''),
          ),
        ],
      ),
    );
  }

  void selectedItem(BuildContext context, String index) {
    // ~ It works similar to pushNamed, but instead of putting home on top of userProfile, it will replace home with location
    // ~ So location will no longer exist
    /*Navigator.pushReplacementNamed(context, '/$index', arguments: {
      'accountName': widget.accountName,
      'accountEmail': widget.accountEmail,
      'avatar': widget.avatar,
    });*/
  }
}
