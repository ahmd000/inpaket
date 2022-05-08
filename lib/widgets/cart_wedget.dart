import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/widgets/text_app.dart';

class CartApp extends StatefulWidget {
  Image? productImage;
  int? quantity;
  int? price;
  String? productName;
  String? productCategory;
  CartApp(
      {Key? key,
      this.productImage,
      this.quantity,
      this.productName,
      this.price,
      this.productCategory})
      : super(key: key);

  @override
  State<CartApp> createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
          side: BorderSide(
            color: mainColor,
            width: 3.sp,
          )),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.keyboard_arrow_up,
                  color: mainColor,
                ),
                TextApp(text: "${widget.quantity}"),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: mainColor,
                ),
              ],
            ),
            SizedBox(width: 10.w),

            CircleAvatar(
              backgroundImage: AssetImage(acc),
              minRadius: 20.sp,
              maxRadius: 40.sp,
            ),
            // Image.asset(
            //   acc,
            //   width: 50.w,
            // ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(text: "اسم المنتج: ${widget.productName}"),
                  TextApp(text: "الصنف: ${widget.productCategory}"),
                  TextApp(text: "السعر: ${widget.price}"),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
