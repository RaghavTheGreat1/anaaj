import 'package:flutter/material.dart';

// changes to the app build.gradle file {multiDexEnabled true} {  minSdkVersion 19}
void main() {
  runApp(const AnaajApp());
}

class AnaajApp extends StatelessWidget {
  const AnaajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const PreLoginPage(),
    );
  }
}

class PreLoginPage extends StatelessWidget {
  const PreLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        child: Stack(
      children: [
        Scaffold(
            backgroundColor: Color.fromRGBO(23, 18, 20, 0.9),
            // backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/poorimage.webp',
                  height: 300,
                  width: screenSize.width,
                  fit: BoxFit.fitHeight,
                ),
              ],
            )),
        Positioned(
            left: 10,
            top: 280,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(32, 62, 54, 0.7),
                  border: Border.all(
                    color: Color.fromRGBO(32, 62, 54, 0.7),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              // color: Color.fromRGBO(32, 62, 54, 0.7),
              height: 540,
              width: 400,
              child: Column(children: [
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  width: 250,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Institution Login".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Reciever login".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Volunteer login".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                ),
              ]),
            )),
      ],
    ));
  }
}
