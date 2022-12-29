import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

import '../views/preview.dart';
import 'like_provider.dart';

String name = "kenil";

class ImageView extends StatefulWidget {
  final String imgPath;

  ImageView({required this.imgPath});

  ImageViewState createState() => ImageViewState();
}

class ImageViewState extends State<ImageView> {
  // static String KEYLOGIN = "login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var filePath;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerFavorite = FavoriteProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgPath,
            child: InteractiveViewer(
              maxScale: 2,
              child: Container(
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
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            // SocialShare.shareOptions(
                            //     "https://pub.dev/packages/flutter_share/example-+");
                            // FlutterShare.share(text: "https://pub.dev/packages/flutter_share/example-+");
                            Fluttertoast.showToast(
                              msg: "Photo Saved",
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.black,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                            );
                            if (kIsWeb) {
                              _launchURL(widget.imgPath);
                            } else {
                              _save();
                            }
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.withOpacity(0.50),
                                        Colors.black.withOpacity(0.50),
                                      ],
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.download_for_offline_outlined,
                                    color: Colors.white60,
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                ],
                              ))),
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.to(Preview(
                            imgPath: widget.imgPath,
                            page: Text(name),
                          ));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.50),
                                      Colors.black.withOpacity(0.50),
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white60,
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          _onBasicAlertPressed(context);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.50),
                                      Colors.black.withOpacity(0.50),
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wallpaper_rounded,
                                  color: Colors.white60,
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.grey.withOpacity(0.50),
                                  Colors.black.withOpacity(0.50),
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight)),
                        child: IconButton(
                          onPressed: () async {
                            // var sharePref =
                            //     await SharedPreferences.getInstance();
                            // sharePref.setBool(ImageViewState.KEYLOGIN, true);
                            setState(() {});
                            providerFavorite.toggleFavorite(widget.imgPath);
                          },
                          icon: providerFavorite.isExist(widget.imgPath)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white60,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 28),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.withOpacity(0.50),
                                    Colors.black.withOpacity(0.50),
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  _onBasicAlertPressed(context) {
    Alert(
      buttons: [],
      style: AlertStyle(
        isCloseButton: false,
        overlayColor: Colors.black.withOpacity(0.4),
        backgroundColor: Colors.transparent,
        alertBorder: Border.all(style: BorderStyle.none),
        buttonAreaPadding: EdgeInsets.all(10),
      ),
      context: context,
      content: Column(
        children: [
          InkWell(
            onTap: () {
              Fluttertoast.showToast(
                msg: "Set wallpaper",
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 3,
                textColor: Colors.black,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.white.withOpacity(0.5),
                fontSize: 15,
              );
              if (kIsWeb) {
                _launchURL(widget.imgPath);
              } else {
                setwallpaper();
              }
            },
            child: InteractiveViewer(
              child: Container(
                height: MediaQuery.of(context).size.height / 17,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.50),
                          Colors.black.withOpacity(0.50),
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight)),
                child: Center(
                    child: Text(
                  "Home Screen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Overpass'),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Set wallpaper",
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                  textColor: Colors.black,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  fontSize: 15,
                );
                if (kIsWeb) {
                  _launchURL(widget.imgPath);
                } else {
                  setwallpaper_forlock();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 17,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.50),
                          Colors.black.withOpacity(0.50),
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight)),
                child: Center(
                    child: Text(
                  "Lock Screen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Overpass'),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Set wallpaper",
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                  textColor: Colors.black,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  fontSize: 15,
                );
                if (kIsWeb) {
                  _launchURL(widget.imgPath);
                } else {
                  setwallpaper_forboth();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 17,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.50),
                          Colors.black.withOpacity(0.50),
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight)),
                child: Center(
                    child: Text(
                  "Home & Lock Screen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Overpass'),
                )),
              ),
            ),
          ),
        ],
      ),
    ).show();
  }

  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    // Navigator.pop(context);
  }

  Future<void> setwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);
    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

  Future<void> setwallpaper_forlock() async {
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);

    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

  Future<void> setwallpaper_forboth() async {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgPath);

    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

  _askPermission() async {
    // if (Platform.isIOS) {
    //   /*Map<PermissionGroup, PermissionStatus> permissions =
    //       */
    //   await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    // } else {
    //   /* PermissionStatus permission = */ await PermissionHandler()
    //       .checkPermissionStatus(PermissionGroup.storage);
    // }
  }
}
