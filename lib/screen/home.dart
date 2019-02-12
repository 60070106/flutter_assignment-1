import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_compact),
            ),
            Tab(
              icon: Icon(Icons.notifications),
            ),
            Tab(
              icon: Icon(Icons.explore),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white30,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            new Container(
              child: Center(
                child: Text('Home'),
              ),
              color: Colors.white,
            ),
            new Container(
              child: Center(
                child: Text('Notify'),
              ),
              color: Colors.white,
            ),
            new Container(
              child: Center(
                child: Text('Map'),
              ),
              color: Colors.white,
            ),
            new Container(
              child: Center(
                child: Text('Profile'),
              ),
              color: Colors.white,
            ),
            new Container(
              child: Center(
                child: Text('Setup'),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
