import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/models/product_model.dart';
import 'package:inpaket/widgets/app_text_field.dart';
import 'package:inpaket/widgets/card_categorise_home.dart';

import '../detailScreen/detail_product_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController _searchEditingController = TextEditingController();
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

  final product = List<ProductModel>.generate(
    100,
    (index) => ProductModel(
        id: "$index",
        name: 'Product ${index + 1}',
        detail: 'Details Product $index',
        image: logoBrownImage,
        price: "${index * 4}", quantity: '15', overalRate: 4.5),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
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
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.sp,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 20.sp,
                  mainAxisSpacing: 20.sp,
                ),
                itemCount: product.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProductScreen(
                                  product: product[index])));
                    },
                    child: CardCategoriseHome(
                      title: product[index].name,
                      image: product[index].image,
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
