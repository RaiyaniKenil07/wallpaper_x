import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../main.dart';
import '../views/full_screen.dart';
import 'like_provider.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final photos = provider.photos;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // surfaceTintColor: Colors.black,
        title: Text(
          "Wish list",
          style: LocalFont,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.6),
          itemCount: photos.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return GestureDetector(
              onTap: () {
                Get.to(ImageView(imgPath: photos[index]));
              },
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: NetworkImage(photo), fit: BoxFit.cover),
                  ),
                  child: ClipRRect(
                    // color: Colors.black,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {
                          // var sharePref = await SharedPreferences.getInstance();
                          // sharePref.setBool(ImageViewState.KEYLOGIN, true);
                          setState(() {});
                          provider.toggleFavorite(photo);
                        },
                        icon: provider.isExist(photo)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
