import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/drawer_dcreen/HeaderAccount.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:inpaket/widgets/list_tile_app.dart';
import 'package:inpaket/widgets/text_app.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 7.sp,
      child: ListView(
        shrinkWrap: false,
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 30.sp),
        children: [
       const HeaderAccount(),
          TextApp(
            text: "sections".tr,
            fontColor: Colors.black,
            textAlign: TextAlign.start,
          ),
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
          SizedBox(
            height: 7.h,
          ),
          Divider(
            color: Colors.black,
            indent: 20.sp,
          ),
          SizedBox(
            height: 7.h,
          ),
          TextApp(
            text: "services".tr,
            fontColor: Colors.black,
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/cart_screen");
            },
            child: ListTileApp(
              textTitle: "cart".tr,
              iconLeading: const Icon(Icons.shopping_cart_outlined),
              iconTrailing: const Icon(Icons.navigate_next),
            ),
          ),
          InkWell(
            onTap: (){
setState(() {
  page = 2;
});
              Navigator.pop(context);

            },
            child: ListTileApp(
              textTitle: "favorite".tr,
              iconLeading: const Icon(Icons.favorite_border),
              iconTrailing: const Icon(Icons.navigate_next),
            ),
          ),
          InkWell(
            child: ListTileApp(
              textTitle: "orders".tr,
              iconLeading: const Icon(Icons.store),
              iconTrailing: const Icon(Icons.navigate_next),
            ),
          ),
          Divider(
            color: Colors.black,
            indent: 20.sp,
          ),
          SizedBox(
            height: 7.h,
          ),
          TextApp(
            text: "contactUs".tr,
            fontColor: Colors.black,
            textAlign: TextAlign.start,
          ),
          InkWell(
            child: ListTileApp(
              textTitle: "whatsapp".tr,
              iconLeading: const Icon(Icons.call),
              iconTrailing: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }


}
