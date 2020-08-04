import 'package:flutter/material.dart';

// TODO: Magic layout numbers
class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  // TODO: Move to common and generalize
  Widget _buildAppBar() => AppBar(
        title: Text("Catalog"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.cloud_done,
                color: Colors.white,
              ),
              onPressed: null),
          new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      );

  Widget _buildBody(BuildContext context) => Center(
          child: Column(children: <Widget>[
        _buildSearch(),
        _buildCategories(context),
        const Divider(
          color: Colors.black26,
          height: 60,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Flexible(child: _buildCommonlyRequested(context)),
      ]));

  // TODO: Move to common and generalize
  Widget _buildBottomBar(BuildContext context) => BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.blue,
        currentIndex: 0,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.library_books), // menu_book missing
            title: new Text('Catalog'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            title: new Text('Order History'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account'))
        ],
        onTap: (int newIndex) {
          if (newIndex == 1) {
            Navigator.pushNamed(context, "/orders");
          }
          if (newIndex == 2) {
            Navigator.pushNamed(context, "/account");
          }
        },
      );

  Widget _buildSearch() => Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Search the catalog',
            border: const OutlineInputBorder(),
          ),
        ),
      );

  Widget _commonRequest(BuildContext context) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Bottled Water (Cases)",
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text("Quanity:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                ),
                Text("3,000 packs", style: TextStyle(fontSize: 18.0)),
              ],
            ),
            SizedBox(height: 5),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blue,
              onPressed: () {},
              child: Text(
                "ADD TO CART",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      );

  Widget _categoryTile(BuildContext context, String label, String imgPath) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
        child: SizedBox(
          width: 125,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: 100,
                  child: Image.asset(imgPath),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black26),
                  ),
                ),
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      label,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6,
                    )),
              )
            ],
          ),
        ),
      );

  Widget _buildCategories(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "Browse by Category",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: ConstrainedBox(
                // TODO: Make this adjust dynamically
                constraints: BoxConstraints(maxHeight: 155),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _categoryTile(context, "Chow", "images/chow.png"),
                    SizedBox(width: 15),
                    _categoryTile(context, "Water", "images/water.png"),
                    SizedBox(width: 15),
                    _categoryTile(context, "Ammo", "images/ammo.png"),
                    SizedBox(width: 15),
                    _categoryTile(context, "Fuel", "images/fuel.png"),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildCommonlyRequested(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "Commonly Requested",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: GridView.count(
                childAspectRatio: 2.0,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                crossAxisCount: 2,
                children: List.generate(20, (index) {
                  return _commonRequest(context);
                }),
              ),
            ),
          ],
        ),
      );
}
