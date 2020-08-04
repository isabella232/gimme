import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// TODO: Magic layout numbers
class OrderHistoryScreen extends StatelessWidget {
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
        title: Text("Order History"),
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
          child: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        child: ListView(children: <Widget>[
          _orderTile(context),
          SizedBox(height: 20),
          _orderTile(context),
          SizedBox(height: 20),
          _orderTile(context),
        ]),
      ));

  // TODO: Move to common and generalize
  Widget _buildBottomBar(BuildContext context) => BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.blueGrey,
        currentIndex: 1,
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
          if (newIndex == 2) {
            Navigator.pushNamed(context, "/account");
          }
          if (newIndex == 0) {
            Navigator.pushNamed(context, "/catalog");
          }
        },
      );

  Widget _bubbleText(String text) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.black12),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
      );

  Widget _tileField(String key, String value, {Widget padding}) => Row(
        children: <Widget>[
          Text(key,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
          ),
          Text(value, style: TextStyle(fontSize: 18.0)),
          if (padding != null) padding,
        ],
      );

  Widget _tileFields(List pairs) => Row(
        children: pairs
            .map((p) =>
                _tileField(p.item1, p.item2, padding: SizedBox(width: 10)))
            .toList(),
      );

  Widget _tileComment(String body) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Comments:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
          ),
          Flexible(
              child: Text(body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 18.0))),
        ],
      );

  Widget _orderTile(BuildContext context) => Container(
      padding: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _bubbleText('In Progress'),
              Spacer(),
              Text('VIEW ORDER',
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "68 amp hubbles",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          _tileField("Order:", "30Jul20100932-M20362-30107"),
          SizedBox(height: 20),
          _tileField("Priority:", "Urgent"),
          SizedBox(height: 20),
          _tileFields(<Tuple2<String, String>>[
            Tuple2("Date Submitted:", "Jul 30, 2010"),
            Tuple2("Due Date:", "Aug 02, 2010"),
          ]),
          SizedBox(height: 20),
          _tileComment(
              "Example of comment text and length would be helpful for this field"),
        ],
      ));
}
