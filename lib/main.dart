import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gimme/GroupScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Gimme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gimme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List list = ['foo', 'bar'];

  List<SupplyGroup> supplyGroups = <SupplyGroup>[
    SupplyGroup(
      path: 'images/water.png',
      caption: 'Water',
    ),
    SupplyGroup(
      path: 'images/chow.png',
      caption: 'Chow',
    ),
    SupplyGroup(
      path: 'images/ammo.png',
      caption: 'Ammo',
    ),
    SupplyGroup(
      path: 'images/warehouse.png',
      caption: 'Somethin\' Else',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: Text("Gimme"),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                    //Navigator.push
                },
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null),
                    list.length == 0
                        ? new Container()
                        : new Positioned(
                            child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange.shade500),
                              new Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: new Center(
                                    child: new Text(
                                      list.length.toString(),
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.home),
                      title: new Text("Home"),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting_Screen(toolbarname: 'Setting',)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.history),
                      title: new Text("Your Requests"),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting_Screen(toolbarname: 'Setting',)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.settings),
                      title: new Text("Settings"),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting_Screen(toolbarname: 'Setting',)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.help),
                      title: new Text("Help"),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Help_Screen(toolbarname: 'Help',)));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Container(
              alignment: Alignment.topCenter,
              height: 700.0,
              child: new GridView.builder(
                  itemCount: supplyGroups.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupScreen(toolbarname: supplyGroups[index].caption,)));
                        },
                        child: new Container(
                            margin: EdgeInsets.all(5.0),
                            child: new Card(
                              shape: shapeBorder,
                              elevation: 3.0,
                              child: new Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 272.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                              child: Image.asset(
                                            supplyGroups[index].path,
                                            fit: BoxFit.cover,
                                          )),
                                          Container(
                                            color: Colors.transparent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 3.0, bottom: 3.0),
                                            alignment: Alignment.bottomLeft,
                                            child: new GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupScreen(toolbarname: supplyGroups[index].caption,)));
                                              },
                                              child: new Text(
                                                supplyGroups[index].caption,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 32.0,
                                                    color: Colors.indigo,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // new Text(photos[index].title.toString()),
                                  ],
                                ),
                              ),
                            )));
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

class SupplyGroup {
  SupplyGroup({
    this.path,
    this.caption,
  });

  final String path;
  final String caption;
}
