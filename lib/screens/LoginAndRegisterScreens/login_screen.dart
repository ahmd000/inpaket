import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/api/controllers/auth_api_controller.dart';
import 'package:inpaket/helpers/helpers.dart';
import 'package:inpaket/widgets/app_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/widgets/text_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  String? _mobileErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 91.h,
                ),
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage(logoBrownImage))),
                ),
                SizedBox(height: 200.h),
                ElevatedButton(
                  onPressed: () => performLogin(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(facebookLoginIcon),
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      TextApp(
                        text: LocaleKeys.loginFacebook.tr(),
                        fontColor: gradingColor1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),


                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home_screen');

                    // performLogin();

                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(googleLoginIcon),
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      TextApp(
                        text: LocaleKeys.loginGoogle.tr(),
                        fontColor: gradingColor1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _mobileTextController.text,
      password: _passwordTextController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/home_screen');
    print(status);
  }
}
