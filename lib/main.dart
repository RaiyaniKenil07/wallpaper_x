import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_x/view/like_provider.dart';
import 'home.dart';

var TitleFont = Text(
  "4k Wallpaper",
  style: GoogleFonts.kalam(
    textStyle: TextStyle(fontSize: 25, color: Colors.black),
  ),
);
var LocalFont = GoogleFonts.kalam(
  textStyle: TextStyle(fontSize: 18, color: Colors.black),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _a = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });

    Timer(Duration(seconds: 2), () {
      // Get.to(SecondPage());
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(SecondPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? _width : 0,
            height: _height,
            color: Colors.black,
            child: Container(
              child: Image(
                image: NetworkImage(
                    'https://images.pexels.com/photos/3881036/pexels-photo-3881036.jpeg?auto=compress&cs=tinysrgb&w=600'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text('4K Wallpaper',
                style: GoogleFonts.athiti(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: Colors.blue,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
            create: (_) => FavoriteProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
