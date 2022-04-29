import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/models/product_model.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/text_app.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final bool _isFavorite = false;
  late final ProductModel productModel;
  IconData? _selectedIcon;
  final double _initialRating = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _future =
    //     ProductDetailsApiController().showProductDetails(widget.id);
    // FavoriteProductGetxController.to.getFavoriteProduct();
    // _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff23203f),
            ),
          ),
          title: TextApp(
            text: widget.product.name,
            fontSize: 25.sp,
            fontColor: mainColor,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.product.image))),
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  children: [
                    Expanded(
                      child: TextApp(
                        text: widget.product.name,
                        // "Lorem Ipsum is",
                        // overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                        fontSize: 25.sp,
                        fontColor: const Color(0xff23203F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        TextApp(
                          text: widget.product.overalRate,
                          fontSize: 20.sp,
                          fontColor: const Color(0xff716F87),
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Icon(
                          Icons.star,
                          color: mainColor,
                          size: 24.w,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextApp(
                        text: LocaleKeys.price.tr(),
                        textAlign: TextAlign.start,
                        fontSize: 19.sp,
                        fontColor: const Color(0xff23203F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextApp(
                      text: "${widget.product.price}",

                      fontSize: 23.sp, fontColor: mainColor,
                      // const Color(0xff23203F),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: '${LocaleKeys.quantity.tr()}',
                      fontSize: 20.sp,
                      fontColor: const Color(0xff23203F),
                      fontWeight: FontWeight.w600,
                    ),
                    TextApp(
                      text: '${widget.product.quantity}',
                      fontSize: 20.sp,
                      fontColor: mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: LocaleKeys.rate.tr(),
                      fontSize: 20.sp,
                      fontColor: const Color(0xff23203F),
                      fontWeight: FontWeight.w600,
                    ),
                    RatingBar.builder(
                      glow: false,
                      // glowColor: Colors.amber,
                      initialRating: _initialRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 24,
                      updateOnDrag: true,
                      itemBuilder: (context, _) => Icon(
                        _selectedIcon ?? Icons.star,
                        color: mainColor,
                      ),
                      onRatingUpdate: (rating) {
                        // RateProductApiController().rateProduct(
                        //     context,
                        //     productId: widget.id,
                        //     rate: _rating
                        // );
                        // print(rating);
                        // setState(() {
                        //   _rating = rating;
                        // });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextApp(
                      text: '${LocaleKeys.itemDescription.tr()}:',
                      textAlign: TextAlign.center,
                      fontSize: 20.sp,
                      fontColor: const Color(0xff23203F),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  flex: 2,
                  child: TextApp(
                    text: widget.product.detail,
                    maxLine: 7,
                    fontSize: 20.sp,
                    fontColor: mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),

            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //     minHeight: 10.h,
            //     maxHeight: 200.h,
            //     minWidth: double.infinity,
            //   ),
            //   child: snapshot.data!.images.isNotEmpty
            //       ? Swiper(
            //           duration: 500,
            //           autoplay: true,
            //           itemCount: snapshot.data!.images.length,
            //           viewportFraction: 0.7,
            //           scale: 0.8,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Stack(
            //                   alignment: AlignmentDirectional.bottomEnd,
            //                   children: [
            //                     Container(
            //                       clipBehavior: Clip.antiAlias,
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(25),
            //                       ),
            //                       child: SizedBox(
            //                         height: 200.h,
            //                         width: double.infinity,
            //                         child: Image.network(
            //                           snapshot.data!.images[index].imageUrl,
            //                           // widget.product.imageUrl[index],
            //                           fit: BoxFit.fill,
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             );
            //           },
            //         )
            //       : const Center(
            //           child: Text("no Data"),
            //         ),
            // ),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.sp),
                        ),
                      ),
                      height: 75.h,
                      child: TextApp(
                        text: "Add to Order",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.sp),
                        ),
                      ),
                      height: 75.h,
                      child: TextApp(
                        text: "Add to Favorait",
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
