import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {

  final PageController pageController;
  AppDrawer({this.pageController});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  Widget drawerButton({String name, IconData icon, int page}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        widget.pageController.jumpToPage(page);
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade900,
              Colors.orange.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage("assets/mcFaseta.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            drawerButton(icon: Icons.people, name: "Clients", page: 3),
            drawerButton(icon: Icons.settings, name: "Configuration", page: 4),
          ],
        ),
      ),
    );
  }
}
