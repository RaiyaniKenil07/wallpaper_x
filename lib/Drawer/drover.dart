import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../view/like_view.dart';
import 'drawer_page/app_tour.dart';
import 'drawer_page/doubble_wallpaper.dart';

var star = Icon(Icons.star, color: Colors.white.withOpacity(0.50));

const url =
    "https://safety.google/?utm_source=google&utm_medium=cpc&utm_campaign=safety_center&utm_term=google_user_privacy&gclsrc=ds&gclsrc=ds";

var MyDrawer = BackdropFilter(
  filter: ImageFilter.blur(
    sigmaX: 5.0,
    sigmaY: 5.0,
  ),
  child: Builder(builder: (context) {
    return Drawer(
      elevation: 10,
      // width: 280,
      backgroundColor: Colors.white.withAlpha(150),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: SafeArea(
                child: Image(
                  image: AssetImage("assets/draver/685681.png"),
                  height: 80,
                  width: 120,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TitleFont,
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(DoubleWallpaper(), transition: Transition.rightToLeft);
              },
              child: ListTile(
                leading:
                    Icon(Icons.devices_outlined, color: Colors.black, size: 23),
                title: Text(
                  "Doubble Wallpaper",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.snackbar(
                  "Not available now",
                  "Coming soon",
                  borderWidth: 1,
                  borderColor: Colors.black,
                );
              },
              child: ListTile(
                leading: Icon(Icons.phone_android_sharp,
                    color: Colors.black, size: 23),
                title: Text(
                  "Edge Lighting Wallpaper",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(FavoritePage(), transition: Transition.rightToLeft);
              },
              child: ListTile(
                leading:
                    Icon(Icons.favorite_border, color: Colors.black, size: 23),
                title: Text(
                  "My Favorite",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.download, color: Colors.black, size: 23),
                title: Text(
                  "My Download",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.snackbar(
                  "Not available now",
                  "Coming soon",
                  borderWidth: 1,
                  borderColor: Colors.black,
                );
              },
              child: ListTile(
                leading:
                    Icon(Icons.image_outlined, color: Colors.black, size: 23),
                title: Text(
                  "Auto Wallpaper Changer",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.to(AppTourPage(), transition: Transition.rightToLeft);
              },
              child: ListTile(
                leading: Icon(Icons.location_on_outlined,
                    color: Colors.black, size: 30),
                title: Text(
                  "App Tour",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: _launchURL,
              child: ListTile(
                leading:
                    Icon(Icons.policy_outlined, color: Colors.black, size: 23),
                title: Text(
                  "Privacy Policy",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                // Get.dialog(
                //   AlertDialog(
                //     title: Text("This should not be closed automatically"),
                //     content: Text("This should not be closed automatically"),
                //     actions: [
                //       FloatingActionButton(
                //         child: Text("CLOSE"),
                //         onPressed: () {
                //           Get.toNamed("/HomePage");
                //         },
                //       )
                //     ],
                //   ),
                //   barrierDismissible: false,
                // );
                Get.defaultDialog(
                  title: "Rate Us",
                  titleStyle: TextStyle(
                    color: Colors.white,
                  ),
                  content: GestureDetector(
                    onTap: _shareURL,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        star,
                        star,
                        star,
                        star,
                        star,
                      ],
                    ),
                  ),
                  backgroundColor: Colors.grey,
                  // cancelTextColor: Colors.white,
                  // textCancel: "Cancel",
                  // buttonColor: Colors.white,
                );
              },
              child: ListTile(
                leading: Icon(Icons.thumb_up_alt_outlined,
                    color: Colors.black, size: 23),
                title: Text(
                  "Rate App",
                  style: LocalFont,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Share.share(
                  "https://play.google.com/store/apps/details?id=com.nekki.shadowfight",
                );
              },
              child: ListTile(
                leading: Icon(Icons.share, color: Colors.black, size: 23),
                title: Text(
                  "Share App",
                  style: LocalFont,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }),
);

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_shareURL() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.gameloft.android.ANMP.GloftA9HM';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
