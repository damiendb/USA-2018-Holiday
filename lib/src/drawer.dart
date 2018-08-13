import 'package:flutter/material.dart';
//import 'usa2018.dart';
//import 'basedata.dart';
//import 'baseclasses.dart';


class StartupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        //leading: new Icon(Icons.menu),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
            },
          ),
        title: new Text("Start Up Page"),
        ),
      body: new Center(
        child: new Text("this page is the home page"),
        ),
      floatingActionButton: new FloatingActionButton(
        elevation: 0.0,
        child: new Icon(Icons.add),
          onPressed: (){}
        )
      );
      
    }
}


class TelstraVMailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
            //setState(){ _selectedDrawerIndex = index)};
            //Navigator.push(context, 'route')
            //Navigator.pop(context);
            },
          ),
        title: new Text("Telstra Voice Mail"),
        ),
      body: new Center(
        child: new Text("This is the Telstra Voice Mail Page"),
        ),
      );
  }

}

class PomodoroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
            //setState(){ _selectedDrawerIndex = index)};
            //Navigator.push(context, 'route')
            //Navigator.pop(context);
            },
          ),
        title: new Text("Pomodoro Planner"),
        ),
      body: new Center(
        child: new Text("This is the Income Pomodoro Planner Page"),
        ),
      );
  }

}

class TipCalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow,
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
            //setState(){ _selectedDrawerIndex = index)};
            //Navigator.push(context, 'route')
            //Navigator.pop(context);
            },
          ),
        title: new Text("Tip Calculator"),
        ),
      body: new Center(
        child: new Text("This is the Tip Calculator Page"),
        ),
      );
  }

}