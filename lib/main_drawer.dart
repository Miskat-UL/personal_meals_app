import 'package:flutter/material.dart';
import 'filter_widget.dart';




class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListMethod(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildListMethod(
            Icons.settings,
            'Filters',
            () {
              Navigator.pushReplacementNamed(context, FilterScreenWidget.routename);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListMethod(IconData icon, String text, Function onTapHandle) {
    return ListTile(
      onTap: onTapHandle,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
