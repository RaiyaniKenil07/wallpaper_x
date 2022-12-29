// import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:wallpaper/data/data.dart';
// import 'package:wallpaper/models/photos_model.dart';
// import 'package:wallpaper/widget/widget.dart';
//
// import '../main.dart';
//
// class SearchView extends StatefulWidget {
//   final String search;
//
//   SearchView({@required this.search});
//
//   @override
//   _SearchViewState createState() => _SearchViewState();
// }
//
// class _SearchViewState extends State<SearchView> {
//   List<PhotosModel> photos = new List();
//   TextEditingController searchController = new TextEditingController();
//
//   getSearchWallpaper(String searchQuery) async {
//     await http.get(
//         "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1",
//         headers: {"Authorization": apiKEY}).then((value) {
//       //print(value.body);
//
//       Map<String, dynamic> jsonData = jsonDecode(value.body);
//       jsonData["photos"].forEach((element) {
//         //print(element);
//         PhotosModel photosModel = new PhotosModel();
//         photosModel = PhotosModel.fromMap(element);
//         photos.add(photosModel);
//         //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
//       });
//
//       setState(() {});
//     });
//   }
//
//   @override
//   void initState() {
//     getSearchWallpaper(widget.search);
//     searchController.text = widget.search;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         iconTheme: IconThemeData(color: Colors.black),
//         surfaceTintColor: Colors.black,
//         title: TitleFont,
//         centerTitle: true,
//         backgroundColor: Colors.white.withAlpha(100),
//         flexibleSpace: ClipRect(
//           // clipper: ,
//           clipBehavior: Clip.antiAlias,
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//             child: Container(
//               color: Colors.white.withAlpha(80),
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xfff5f8fd),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 margin: EdgeInsets.symmetric(horizontal: 24),
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: TextField(
//                       controller: searchController,
//                       decoration: InputDecoration(
//                           hintText: "search wallpapers",
//                           border: InputBorder.none),
//                     )),
//                     InkWell(
//                         onTap: () {
//                           getSearchWallpaper(searchController.text);
//                         },
//                         child: Container(child: Icon(Icons.search)))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               wallPaper(photos, context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
