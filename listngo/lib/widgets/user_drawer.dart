import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';

class drawerWidget extends StatefulWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        color: Color.fromARGB(50, 150, 122, 225),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 108, 99, 255)),
                accountName: Text("User Name"),
                accountEmail: Text("user@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dp.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.heart,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Favorites",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.cart,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_down_right_arrow_up_left,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Transactions",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                color: Color.fromARGB(255, 0, 3, 1),
              ),
              title: Text(
                "Edit details",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
