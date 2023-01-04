import 'package:anaaj/screens/receiver/home_screen/marketplace_screen.dart';
import 'package:anaaj/screens/receiver/home_screen/screens/marketplace_entity_screen.dart';
import 'package:anaaj/screens/volunteers/CurrentOrder.dart';
import 'package:anaaj/screens/volunteers/History.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class VolunteerDashboard extends StatefulWidget {
  const VolunteerDashboard({super.key});

  @override
  State<VolunteerDashboard> createState() => _VolunteerDashboardState();
}

class _VolunteerDashboardState extends State<VolunteerDashboard> {
  final List<String> _pageTitles = ['CurrentOrder', 'History'];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Volunteer Dashboard"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _pageTitles.map((title) {
                    int index = _pageTitles.indexOf(title);
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: _currentPage == index
                                  ? Colors.blue
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: _currentPage == index
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          Container(
            child: CurrentOrder(),
          ),
          Container(
            child: History(),
          ),
        ],
      ),
    );
  }
}
