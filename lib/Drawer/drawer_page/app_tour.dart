import 'package:flutter/material.dart';

import '../../main.dart';

class AppTourPage extends StatefulWidget {
  @override
  State<AppTourPage> createState() => _AppTourPageState();
}

class _AppTourPageState extends State<AppTourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // surfaceTintColor: Colors.black,
        title: Text(
          "App Tour",
          style: LocalFont,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            // color: Colors.black,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.deepPurple,
                ],
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/photos.jpg'),
                            fit: BoxFit.fill),
                        border: Border.all(color: Colors.white, width: 5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width / 1.7,
                    // color: Colors.white,
                    // child: Image.asset('assets/photos.jpg', fit: BoxFit.fill),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  TitleFont,
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
