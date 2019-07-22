import 'package:flutter/material.dart';
import 'package:flutter_job_portal_app/Colors.dart';
import 'package:flutter_job_portal_app/main.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];


  BottomNavBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.home, color: primaryColor,),
        icon: Icon(Icons.home,color: Colors.grey,),
        title: Text("Home")
      )
    );

    bottomBarItems.add(
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.message, color: primaryColor,),
            icon: Icon(Icons.message,color: Colors.grey,),
            title: Text("Inbox")
        )
    );

    bottomBarItems.add(
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings, color: primaryColor,),
            icon: Icon(Icons.settings,color: Colors.grey,),
            title: Text("Settings")
        )
    );

    bottomBarItems.add(
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.search, color: primaryColor,),
            icon: Icon(Icons.search,color: Colors.grey,),
            title: Text("")
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: bottomBarItems,
      type: BottomNavigationBarType.fixed,
      onTap: (item){
        switch(item){
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
        }
      },
    );
  }
}
