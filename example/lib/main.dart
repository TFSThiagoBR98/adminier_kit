import 'package:flutter/material.dart';
import 'package:adminierkit/adminierkit.dart';

import 'logo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue.shade400,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AdminierScaffold(
      appBar: AdminierNavbar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                AdminierScaffold.of(context).toggleSidebar();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: NavbarTitle(
          leading: CustomPaint(
              painter: TFSLogo(), child: SizedBox(width: 32, height: 32)),
          title: Text("Admin Example"),
        ),
        actions: [
          NavbarUserPopUpButton<VoidCallback>(
            itemBuilder: (context) {
              return [
                PopupMenuItem<VoidCallback>(
                    value: () {},
                    child: TextIconWidget(
                        icon: Icon(Icons.logout), label: Text("Log out")))
              ];
            },
            email: "teste@teste.com",
          )
        ],
      ),
      drawer: AdminierSidebarDrawer(
        menus: [
          SidebarMenu(
            leading: Icon(Icons.dashboard),
            onTap: () {
              print("clij");
            },
            title: Text("Dashboard"),
          ),
          SidebarDropdown(
            leading: Icon(Icons.people),
            title: Text("Users and Permissions"),
            submenus: [
              SidebarMenu(
                leading: Icon(Icons.work),
                onTap: () {},
                title: Text("Companies"),
              ),
              SidebarMenu(
                leading: Icon(Icons.person),
                onTap: () {},
                title: Text("Users"),
              ),
              SidebarDropdown(
                leading: Icon(Icons.fact_check),
                title: Text("Roles and Permissions"),
                submenus: [
                  SidebarMenu(
                    leading: Icon(Icons.business_center),
                    onTap: () {},
                    title: Text("Roles"),
                  ),
                  SidebarMenu(
                    leading: Icon(Icons.rule),
                    onTap: () {},
                    title: Text("Permissions"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
