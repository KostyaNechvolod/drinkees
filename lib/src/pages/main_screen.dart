import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:drinkees/src/pages/home_page.dart';
import 'package:drinkees/src/pages/random_drink_page.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lime',
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}


class _MainPageState extends State<MainPage> {

  /// This controller can be used to programmatically
  /// set the current displayed page
  PageController _pageController;

  /// Indicating the current displayed page
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Coctails'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: new PageView(
            children: [
              MyHomePage(),
              RandomDrinkPage(),
              new Container(color: Colors.grey)
            ],

            /// Specify the page controller
            controller: _pageController,
            onPageChanged: onPageChanged
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: Colors.black54,
                ),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.category,
                  color: Colors.black54,
                ),
                title: new Text('Cat.'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.free_breakfast,
                  color: Colors.black54,
                ),
                title: new Text('Random'),
              ),
            ],

            /// Will be used to scroll to the next page
            /// using the _pageController
            onTap: navigationTapped,
            currentIndex: _page
        )
    );
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page){

    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }


  void onPageChanged(int page){
    setState((){
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }


}