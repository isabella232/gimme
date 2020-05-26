import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  final String toolbarname;

  GroupScreen({Key key, this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ItemState(toolbarname);
}

class SupplyItem {
  final String name;
  final String desc;
  final String image;
  final String nsn;

  SupplyItem({this.name, this.desc, this.nsn, this.image});
}

class ItemState extends State<GroupScreen> {


  Map<String, List> itemMap = _generateItems();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String toolbarname;
  List list = ['foo', 'bar'];

  ItemState(this.toolbarname);

  static Map _generateItems() {
    Map<String, List> m = Map();

    List<SupplyItem> water = <SupplyItem>[
      SupplyItem(
          name: 'Water, Drinking, Side Spout',
          desc: '4 oz., 40 per box',
          nsn: '8960-01-485-9695',
          image: 'images/sidespout.jpg'),
      SupplyItem(
          name: 'Water, Drinking, Center Spout',
          desc: '4 oz., 40 per box',
          nsn: '8960-01-587-6603',
          image: 'images/centerspout.jpg'),
      SupplyItem(
          name: 'Water, Drinking, No Spout',
          desc: '4 oz., 40 per box',
          nsn: '8960-01-124-4543',
          image: 'images/nospout.jpg'),
      SupplyItem(
          name: 'Water, Drinking, Sterile',
          desc: '16 oz., 25 per box',
          nsn: '8960-00-000-0170',
          image: 'images/sterile.jpg'),
    ];

    List<SupplyItem> chow = <SupplyItem>[
      SupplyItem(
          name: 'Meal, Ready-To-Eat',
          desc: '1 case, 12 MREs per case',
          nsn: '8970-00-149-1094',
          image: 'images/mre.png'),
      SupplyItem(
          name: 'Meal, Ready-to-Eat, Pork-Free',
          desc: '1 case, 12 MREs per case' ,
          nsn: '8970-01-623-9560',
          image: 'images/mre.png'),
    ];

    List<SupplyItem> ammo = <SupplyItem>[
      SupplyItem(
          name: 'Cartridge, 5.56 Millimeter, BALL',
          desc: '1800 cartridges' ,
          nsn: '1305-01-550-5648',
          image: 'images/cartridges.jpg'),
    ];

    m["Water"] = water;
    m["Chow"] = chow;
    m["Ammo"] = ammo;
    return m;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<SupplyItem> itemList = [];
    if (itemMap.containsKey(this.toolbarname)) {
      itemList = itemMap[this.toolbarname];
    }

    double statusBarHeight = MediaQuery.of(context).padding.top;
    final double itemHeight =
        (size.height - kToolbarHeight - statusBarHeight) / 3;
    final double itemWidth = size.width / 2;

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(toolbarname),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                  // Navigator.push
                },
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //Navigator.push
                        }),
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
      body: _generateItemWidgets(itemList, itemWidth, itemHeight),
    );
  }

  Widget _generateItemWidgets(
      List<SupplyItem> itemList, itemWidth, itemHeight) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1;

    if (itemList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No items in this category',
              style: descriptionStyle.copyWith(
                fontSize: 32.0,
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(4.0),
              children: itemList.map((SupplyItem i) {
                return SupplyItemWidget(
                  item: i,
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}

class SupplyItemWidget extends StatelessWidget {
  SupplyItemWidget({Key key, @required this.item, this.shape})
      : assert(item != null),
        super(key: key);

  final SupplyItem item;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1;

    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                //Navigator.push
              },
              child: Card(
                shape: shape,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 125.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),

                    Expanded(
                      child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: Column(children: <Widget>[
                            DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      item.name,
                                      style: descriptionStyle.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    child: Text(
                                      item.desc,
                                      style: descriptionStyle.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                    ),

                    Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.indigo),
                          child: const Text('Add'),
                          textColor: Colors.indigo,
                          onPressed: () {
                            //Navigator.push
                          },
                          shape: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}