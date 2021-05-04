import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List screens = [
    'Home Screen',
    'Search Screen',
    'Favourite Screen',
    'setting Screen',
  ];
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192734),
      appBar: AppBar(
        title: Text('bottomAppBar'),
        centerTitle: true,
        backgroundColor: Color(0xff22303c),
      ),
      body: Center(child: Text(screens[currentIndex])),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: 'favorite', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings)),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: LikeButton(
          size: 20,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? Colors.pink : Colors.grey,
              size: 20,
            );
          },
        ),
        //  Icon(
        //   Icons.favorite,
        // color: isFavourite ? Colors.red : Colors.white,
        // ),
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
        backgroundColor: Colors.amber,
        elevation: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
