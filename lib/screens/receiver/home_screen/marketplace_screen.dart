import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MarketPlace'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amberAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_rounded), label: 'Institututions'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: SizedBox(
                  width: 570,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                          'https://www.deccanherald.com/sites/dh/files/article_images/2019/11/28/midday%20meal-1574890801.jpg',
                          width: 400,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Vijaya institute of technology",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.verified_rounded,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.timelapse,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                            Text("Fresh till almost 8:00pm")
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                            Text("Jayanagar 9th Block")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: SizedBox(
                  width: 570,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            'https://www.deccanherald.com/sites/dh/files/article_images/2019/11/28/midday%20meal-1574890801.jpg',
                            width: 400,
                            height: 200,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Vijaya institute of technology",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.verified_rounded,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.timelapse,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                            Text("Fresh till almost 8:00pm")
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.green,
                              ),
                            ),
                            Text("Jayanagar 9th Block")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
