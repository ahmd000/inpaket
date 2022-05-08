import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/helpers/buttom_sheet_helper.dart';
import 'package:inpaket/helpers/dialog_helper.dart';
import 'package:inpaket/widgets/dialog_currency.dart';
import 'package:inpaket/widgets/cart_wedget.dart';
import 'package:inpaket/widgets/text_app.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with showDialogHelper, buttonSheetHelper {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                changeCurrency(context);
              },
              icon: const Icon(
                Icons.currency_exchange_rounded,
                color: Colors.white,
              ))
        ],
        backgroundColor: mainColor,
        title: TextApp(
          text: "cart".tr,
          fontColor: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
              children: [
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
                CartApp(
                  // productImage:  logoBrownImage ,
                  price: 20,
                  productName: "product name 1",
                  quantity: 1,
                  productCategory: "العاب اطفال ",
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                topLeft: Radius.circular(15.sp),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                orderDetailsButtomSheet(context);
              },
              child: TextApp(
                text: "order".tr,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeCurrency(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DialogCurrency();
      },
    );
  }

  void orderDetailsButtomSheet(BuildContext context) {
    showButtonSheet(
      context: context,
      title: "Order detail",
      content: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 16.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: "cartTotal".tr,
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                ),
                TextApp(
                  text: r"2000$",
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: "tax".tr,
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                ),
                TextApp(
                  text: r"40$",
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: "discount".tr,
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                ),
                TextApp(
                  text: r"0$",
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: "totalPrice".tr,
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                ),
                TextApp(
                  text: r"2400$",
                  fontColor: Colors.black,
                  fontSize: 20.sp,
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      fixedSize: const Size(0, 50),
                      elevation: 10.sp,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp))),
                  child: TextApp(
                    text: " Order",
                    fontColor: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
