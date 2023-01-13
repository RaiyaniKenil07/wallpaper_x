import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wallpaper_x/view/image_view.dart';
import 'dart:convert';
import 'Drawer/drover.dart';
import 'data/data.dart';
import 'main.dart';
import 'models/categorie_model.dart';
import 'models/photos_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // List<CategorieModel>? categories;
  int num = 1;
  NativeAd? nativeAd;
  bool isLoaded = false;
  bool isLoadingMore = false;
  List _images = [
    'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1563355/pexels-photo-1563355.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];
  List photos = [];
  int noOfImageToLoad = 70;
  @override
  Future<AdWidget> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/1044960115",
      factoryId: "listTile",
      listener: NativeAdListener(onAdLoaded: (_) {
        setState(() {
          isLoaded = true;
        });
        print("Ad Loaded");
      }, onAdFailedToLoad: (ad, error) {
        print("Ad failed to load");
        // ad.dispose();
      }),
      request: AdRequest(),
    );
    nativeAd!.load();
    await Future.delayed(const Duration(seconds: 4));
    return AdWidget(
      ad: nativeAd!,
      key: Key(nativeAd!.hashCode.toString()),
    );
  }

  Future<void> getTrendingWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=${num}"),
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        num++;
      });
    });
  }

  // Future<void> getTrendingWallpaper() async {
  //   final responce = await http.get(
  //       Uri.parse(
  //           "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=${num}"),
  //       headers: {"Authorization": apiKEY});
  //   if (responce.statusCode == 200) {
  //     final json = jsonDecode(responce.body) as List;
  //     setState(() {
  //       num++;
  //       photos = photos + json;
  //     });
  //   } else {
  //     print("Unexpected responce");
  //   }
  // }

  TextEditingController searchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    //getWallpaper();
    // categories = getCategories();
    // scrollController.addListener(_scrollListener);
    super.initState();
    getTrendingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MyDrawer,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu_open),
          );
        }),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        surfaceTintColor: Colors.black,
        title: TitleFont,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(100),
        flexibleSpace: ClipRect(
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withAlpha(1),
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 87),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 170,
                  color: Colors.white,
                  child: ScrollPageView(
                    checkedIndicatorColor: Colors.black45,
                    indicatorColor: Colors.white70,
                    physics: BouncingScrollPhysics(),
                    delay: Duration(seconds: 4),
                    controller: ScrollPageController(),
                    children:
                        _images.map((image) => _imageView(image)).toList(),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: StaggeredGridView.countBuilder(
                      // : StaggeredTile.count(2, index.isEven ? 1 : 1),
                      // reverse: true,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0.0),
                      crossAxisCount: 3,
                      // reverse: true,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      itemCount:
                          isLoadingMore ? photos.length + 10 : photos.length,
                      itemBuilder: (context, index) {
                        // if (index < photos.length) {
                        if (index != -1) {
                          if (index % 10 == 9) {
                            return SizedBox(
                              height: 600,
                              // child: isLoaded
                              //     ? AdWidget(
                              //         ad: nativeAd!,
                              //       )
                              //     : const Center(child: Text("Ad is Loading...")
                              //         // CircularProgressIndicator()
                              //         ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                Get.to(ImageView(
                                    imgPath:
                                        photos[index].src?.portrait ?? ""));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        photos[index].src?.portrait ?? "",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            );
                          }
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    photos[index].src?.portrait ?? "",
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          );
                        }
                        // } else {
                        //   return const Center(
                        //     child: CircularProgressIndicator(),
                        //   );
                        // }
                      },
                      staggeredTileBuilder: (int index) {
                        if (index != 1) {
                          if (index % 10 == 9) {
                            return StaggeredTile.count(3, 2);
                          } else {
                            return StaggeredTile.count(1, 1.8);
                          }
                        } else {
                          return StaggeredTile.count(1, 1.8);
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _scrollListener() async {
  //   if (isLoadingMore) return;
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     num = num + 1;
  //     getTrendingWallpaper();
  //     setState(() {
  //       isLoadingMore = true;
  //     });
  //     getTrendingWallpaper();
  //     setState(() {
  //       isLoadingMore = false;
  //     });
  //   } else {
  //     print("Load is falied");
  //   }
  // }
}

Widget _imageView(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ClipRRect(
      // clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      child: Image.network(image, fit: BoxFit.cover),
    ),
  );
}
