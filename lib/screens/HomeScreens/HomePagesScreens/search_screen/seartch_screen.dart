import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/widgets/app_text_field.dart';
import 'package:inpaket/widgets/list_tile_app.dart';
import 'package:inpaket/widgets/text_app.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 late TextEditingController _searchEditingController ;
  // List<ProductModel> product = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        backgroundColor: mainColor,
        title: TextApp(
          text: "search".tr,
          fontColor: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              gradient: const LinearGradient(
                begin: AlignmentDirectional.topStart,
                tileMode: TileMode.mirror,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xffebcfb0),
                  Colors.white70,
                ],
              ),
            ),
            child: AppTextField(
              prefixIcon: Icons.search,
              hint: 'Search',
              textEditingController: _searchEditingController,
            ),
          ),

          SizedBox(height: 20.h,),
          _searchEditingController.text.isEmpty
              ? Center(
                  child: Column(
                  children: [
                    InkWell(
                      child: ListTileApp(
                        textTitle: "books".tr,
                        iconTrailing: const Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      child: ListTileApp(
                        textTitle: "childGames".tr,
                        iconTrailing: const Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      child: ListTileApp(
                        textTitle: "textiles".tr,
                        iconTrailing: const Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      child: ListTileApp(
                        textTitle: "calcolation".tr,
                        iconTrailing: const Icon(Icons.navigate_next),
                      ),
                    ),
                  ],
                ))
              : Center(
                  child: TextApp(
                  text: "Searching",
                ))
        ],
      ),
    );
  }
}
