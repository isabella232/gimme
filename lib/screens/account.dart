import 'package:flutter/material.dart';
import 'package:gimme/common/bottom_bar.dart';

// TODO: Magic layout numbers
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: bottomBar(context, 2),
    );
  }

  // TODO: Move to common and generalize
  Widget _buildAppBar() => AppBar(
        title: Text("Account"),
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
          _buildContactInfo(context),
          SizedBox(height: 20.0),
          _buildSavedLocations(context),
        ]),
      ));

  Widget _buildContactInfo(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Contact Information",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(width: 15.0),
                _editButton(context),
              ],
            ),
            SizedBox(height: 20),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Name", style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 20),
                    Text("Sgt Squad Leader"),
                    SizedBox(height: 20),
                    Text("Squad", style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 20),
                    Text("2nd Squad, 2nd Platoon, Echo Company"),
                  ],
                ))
          ],
        ),
      );

  Widget _editButton(BuildContext context) => Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.edit, color: Colors.blueGrey),
            SizedBox(width: 5.0),
            Text('EDIT',
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _buildSavedLocations(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Saved Locations",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(width: 15.0),
                _editButton(context),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("DEFAULT",
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ),
                    _buildRow(),
                  ]),
            )
          ],
        ),
      );

  Widget _buildRow() {
    List<String> locations = [
      "Camp Blue Diamond",
      "FOB Carpenter",
      "COP Cashe South",
    ];

    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
              color: Colors.black26,
            ),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("${locations[index]}"),
          );
        });
  }
}
