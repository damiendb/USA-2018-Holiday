import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart' show defaultTargetPlatform;
//import 'package:flutter/scheduler.dart' show timeDilation;
//import 'dart:async';

import 'src/drawer.dart';
import 'src/usa2018.dart';
import 'src/packinglist.dart';

void main() {  
  runApp(new CoreApp());
}

class DrawerItem {
  String title;
  IconData icon;
  bool enabled; 
  DrawerItem(this.title, this.icon, this.enabled);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home Page", Icons.thumb_up, true),
    new DrawerItem("USA 2018 Holiday", Icons.airplanemode_active, true),
    new DrawerItem("Divider", null, false),
    new DrawerItem("Packing List", Icons.card_travel, true),
    new DrawerItem("Telstra Voicemail", Icons.phone, true),
    new DrawerItem("Pomodoro Planner", Icons.timelapse, true),
    new DrawerItem("Tip Calculator", Icons.attach_money, true),
    new DrawerItem("Divider", null, false),
    new DrawerItem("Contracts", null, true),
    new DrawerItem("Resources", null, true),
    new DrawerItem("Divider", null, false),
    new DrawerItem("Contacts", null, true),
    new DrawerItem("Divider", null, false),
    new DrawerItem("Clients", null, true),
    new DrawerItem("Divider", null, false),
    new DrawerItem("Settings", null, true),
    new DrawerItem("Sign Out", null, true),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class CoreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Travel Central',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
      // routes: <String, WidgetBuilder> {
      //   '/screen1': (BuildContext context) => new Screen1(),
      //   '/screen2' : (BuildContext context) => new Screen2()
      // },
    );
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  //set this to -1 and have an initial blank page

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new StartupPage();     
      case 1:
        return new USA2018Page();
      case 3:
        return new PackingListPage();
      case 4:
        return new TelstraVMailPage();
    case 5:
        return new PomodoroPage();
    case 6:
        return new TipCalculatorPage();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if (d.title != 'Divider') {
        drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            enabled: d.enabled,
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
            )
          );
      }
      else {
        drawerOptions.add(new Divider());
      }
    }

    return new Scaffold(
      
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Damien Drake-Brockman"),
                accountEmail: new Text("damiendb@hotmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: new Text('DD'),
                  ),
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new ExactAssetImage('images/balloons.jpg'),
                    fit: BoxFit.cover,
                    ),
                  ),
                  
              ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      
      //body: new StartupPage(),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}


// class ActivityCards extends StatefulWidget {
//   @override
//   createState() => new ActivityCard();
// }

// class ActivityCard extends State<ActivityCards> {
//   @override
//   Widget build(BuildContext context) {
//     return new Text('Hello Damien\nis this the start');
//   }
// }


