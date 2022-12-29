// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// import '../data/data.dart';
// import '../main.dart';
// import '../models/photos_model.dart';
// import '../widget/widget.dart';
//
// class CategorieScreen extends StatefulWidget {
//   final String categorie;
//
//   CategorieScreen({required this.categorie});
//
//   @override
//   _CategorieScreenState createState() => _CategorieScreenState();
// }
//
// class _CategorieScreenState extends State<CategorieScreen> {
//   List<PhotosModel> photos = [];
//
//   getCategorieWallpaper() async {
//     await http.get(
//         Uri.parse("https://api.pexels.com/v1/search?query=${widget.categorie}&per_page=30&page=1"),
//         headers: {"Authorization": apiKEY}).then((value) {
//       //print(value.body);
//
//       Map<String, dynamic> jsonData = jsonDecode(value.body);
//       jsonData["photos"].forEach((element) {
//         //print(element);
//         PhotosModel photosModel =  PhotosModel(url: '');
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
//     getCategorieWallpaper();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TitleFont,
//         elevation: 0.0,
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: wallPaper(photos, context),
//       ),
//     );
//   }
// }
