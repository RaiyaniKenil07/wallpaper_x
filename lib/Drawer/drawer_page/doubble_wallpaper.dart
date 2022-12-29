import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';

class DoubleWallpaper extends StatefulWidget {
  @override
  State<DoubleWallpaper> createState() => _DoubleWallpaperState();
}

var imageFrame = Builder(builder: (context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        // color: Colors.white38,
        image: DecorationImage(
            image: AssetImage("assets/image-removebg-preview (1).png"),
            fit: BoxFit.fill)),
  );
});

class _DoubleWallpaperState extends State<DoubleWallpaper> {
  List<Widget> _list = [
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/247431/pexels-photo-247431.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/45911/peacock-plumage-bird-peafowl-45911.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/3680904/pexels-photo-3680904.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/2559941/pexels-photo-2559941.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/1624600/pexels-photo-1624600.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/1329711/pexels-photo-1329711.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/13633612/pexels-photo-13633612.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
    Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1670898839060-8b0a8902ee1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.cover)),
                  // color: Colors.black,
                ),
                imageFrame,
              ])
            ],
          ),
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(color: Colors.black),
        // surfaceTintColor: Colors.black,
        title: Text(
          "Double Wallpaper",
          style: LocalFont,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
