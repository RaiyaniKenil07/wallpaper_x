import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../view/image_view.dart';

class Transition extends PageRouteBuilder {
  final Widget page;
  Transition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1500),
          reverseTransitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.bounceIn);
            return ScaleTransition(
              alignment: Alignment.topCenter,
              scale: animation,
              child: child,
            );
          },
        );
}

class Preview extends StatefulWidget {
  final String imgPath;
  final Widget page;

  Preview({super.key, required this.imgPath, required this.page});

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  var time = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: kIsWeb
            ? Image.network(widget.imgPath, fit: BoxFit.cover)
            : CachedNetworkImage(
                imageUrl: widget.imgPath,
                placeholder: (context, url) => Container(
                  color: Color(0xfff5f8fd),
                ),
                fit: BoxFit.cover,
              ),
      ),
      InkWell(
        onTap: () {
          Get.back();
          Get.to(
            Preview2(
              imgPath: widget.imgPath,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: RichText(
                    text: TextSpan(
                  text: DateFormat("kk : m").format(DateTime.now()),

                  // text: "${time.hour} : ",
                  // children: [TextSpan(text: "${time.minute}")],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                )),
              ),
              RichText(
                  text: TextSpan(
                text: DateFormat("E,dd MMMM, yyyy").format(DateTime.now()),
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_drop_up_rounded,
                      color: Colors.white.withOpacity(0.50),
                      size: 30,
                    ),
                    Text(
                      "Tap to unlock",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}

class Preview2 extends StatefulWidget {
  final String imgPath;

  const Preview2({Key? key, required this.imgPath}) : super(key: key);

  @override
  State<Preview2> createState() => _Preview2State();
}

class _Preview2State extends State<Preview2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: kIsWeb
            ? Image.network(widget.imgPath, fit: BoxFit.cover)
            : CachedNetworkImage(
                imageUrl: widget.imgPath,
                placeholder: (context, url) => Container(
                  color: Color(0xfff5f8fd),
                ),
                fit: BoxFit.cover,
              ),
      ),
      InkWell(
        onTap: () {
          Get.back();
          Get.to(ImageView(
            imgPath: widget.imgPath,
          ));
        },
        child: Container(
          width: double.infinity,
          // color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: RichText(
                    text: TextSpan(
                  text: DateFormat("kk : m").format(DateTime.now()),
                  // text: "${time.hour} : ",
                  // children: [TextSpan(text: "${time.minute}")],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                          height: MediaQuery.of(context).size.height / 18,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/685/685681.png")),
                      Image(
                          height: MediaQuery.of(context).size.height / 18,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/2111/2111463.png")),
                      Image(
                          height: MediaQuery.of(context).size.height / 18,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/2983/2983067.png")),
                      Image(
                          height: MediaQuery.of(context).size.height / 18,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/3536/3536445.png")),
                      Image(
                          height: MediaQuery.of(context).size.height / 18,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/566/566769.png")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
