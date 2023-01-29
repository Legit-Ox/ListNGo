import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:listngo/screens/Customer/all_products_screen.dart';
import 'package:listngo/screens/Customer/customer_dashboard.dart';

class drawerWidget extends StatefulWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 207, 204, 252),
          ),
          // margin: EdgeInsets.all(20),

          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,

                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 188, 184, 252)),
                  // Color.fromARGB(255, 108, 99, 255)
                  accountName: Text("User Name"),
                  accountEmail: Text("user@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/dp.jpg"), //user image
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CustomerDashboardScreen()));
                },
                leading: const Icon(
                  CupertinoIcons.home,
                  color: Color.fromARGB(255, 0, 3, 1),
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllProductsScreen(),
                    ),
                  );
                },
                selectedColor: const Color.fromARGB(255, 177, 172, 255),
                leading: const Icon(
                  CupertinoIcons.profile_circled,
                  color: Color.fromARGB(255, 0, 3, 1),
                ),
                title: const Text(
                  "Products",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.heart,
                  color: Color.fromARGB(255, 0, 3, 1),
                ),
                title: Text(
                  "Favorites",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.cart,
                  color: Color.fromARGB(255, 0, 3, 1),
                ),
                title: Text(
                  "Cart",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.arrow_down_right_arrow_up_left,
                  color: Color.fromARGB(255, 0, 3, 1),
                ),
                title: Text(
                  "Transactions",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
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
      ),
    );
  }
}
