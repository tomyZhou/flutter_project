import 'package:flutter/material.dart';
import 'publish_content.dart';
import 'customer_router.dart';

class SpecialBottomNavigationWidget extends StatefulWidget {
  @override
  _SpecialBottomNavigationWidgetState createState() =>
      _SpecialBottomNavigationWidgetState();
}

class _SpecialBottomNavigationWidgetState
    extends State<SpecialBottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (BuildContext context) {
          //    return PublicContentWidget();
          // }));
          Navigator.of(context).push(CustomerRouter(PublishContentWidget()));
        },
        tooltip: "发布",
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max, //wrap_content
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
