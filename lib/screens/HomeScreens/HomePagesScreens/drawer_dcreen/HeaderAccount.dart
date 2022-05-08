import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/FirebaseServices/google_sign_in_services.dart';
import 'package:inpaket/widgets/text_app.dart';

class HeaderAccount extends StatefulWidget {
  const HeaderAccount({Key? key}) : super(key: key);

  @override
  State<HeaderAccount> createState() => _HeaderAccountState();
}

class _HeaderAccountState extends State<HeaderAccount> {
  final FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return _service.user != null
        ? UserAccountsDrawerHeader(
            accountEmail: TextApp(text: "${_service.user!.phoneNumber}"),
            accountName: TextApp(text: "${_service.user!.displayName}"),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
            currentAccountPicture: _service.user!.photoURL != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage("${_service.user!.photoURL}"),
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(
                      profileImage,
                    ),
                  ),
          )
        : DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  logoBrownImage,
                  height: 75.h,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login_screen");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextApp(
                          text: "signIn".tr,
                          fontColor: Colors.white,
                          fontSize: 15.sp,
                        ),
                        Icon(
                          Icons.login,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
