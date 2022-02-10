import 'package:flutter/material.dart';
import 'package:restrurent_app/categoryItem.dart';
import 'package:restrurent_app/category_screen.dart';
import 'package:restrurent_app/filter_widget.dart';
import 'favouraite_meals_screen.dart';
import 'main_drawer.dart';
// class TabScreens extends StatefulWidget {
//   @override
//   _TabScreensState createState() => _TabScreensState();
// }

// class _TabScreensState extends State<TabScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("meals"),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoryScreen(),
//             FavouraitMealsDcreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TabsScreens extends StatefulWidget {
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List<Map<String, dynamic>> _state = [
    {'page': CategoryScreen(), 'Text': "Categories"},
    {'page': FavouraitMealsDcreen(), "Text": "Favotire"},
  ];

  int _selectItem = 0;

  void _selectScreen(int value) {
    setState(() {
      _selectItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_state[_selectItem]['Text']),
      ),
      drawer: BuildDrawer(),
      body: _state[_selectItem]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectItem,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

