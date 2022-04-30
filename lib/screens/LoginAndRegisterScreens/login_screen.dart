import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/FirebaseServices/google_sign_in_services.dart';
import 'package:inpaket/helpers/dialog_helper.dart';
import 'package:inpaket/helpers/snack_bar_helpers.dart';
import 'package:inpaket/widgets/app_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:inpaket/widgets/code_text_field.dart';

import 'package:inpaket/widgets/text_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SnackBarHelpers, showDialogHelper {
  bool isLoading = false;
  late TextEditingController _mobileTextController;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _fifthCodeTextController;
  late TextEditingController _sixthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  late FocusNode _fifthFocusNode;
  late FocusNode _sixthFocusNode;

  String _code = "";
  String verificationID = "";

  String? _mobileErrorText;
  String? otpErrorText;
  FirebaseAuth user = FirebaseAuth.instance;
  String countryCode = "";
  bool otpVisibility = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _fifthCodeTextController = TextEditingController();
    _sixthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    _fifthFocusNode = FocusNode();
    _sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextController.dispose();
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _fifthCodeTextController.dispose();
    _sixthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                  height: 60.h,
                ),
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage(logoBrownImage))),
                ),
                SizedBox(height: 50.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// هنا اجعل العلم والرقم داخل مربع النص وليس خارجه وضع فاصل مثل (|)
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                            textEditingController: _mobileTextController,
                            prefixIcon: Icons.phone,
                            hint: LocaleKeys.enterMobile.tr(),
                            textInputType: TextInputType.number,
                            errorText: _mobileErrorText,
                          ),
                        ),
                        Expanded(
                            child: CountryCodePicker(
                              onChanged: _onCountryChange,
                              initialSelection: '+964',
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              favorite: const [
                                '+964',
                              ],
                            )),
                      ],
                    ),
                    Visibility(
                      visible: otpVisibility,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _firstCodeTextController,
                                  focusNode: _firstFocusNode,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      _secondFocusNode.requestFocus();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _secondCodeTextController,
                                  focusNode: _secondFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _thirdFocusNode.requestFocus()
                                        : _firstFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _thirdCodeTextController,
                                  focusNode: _thirdFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _fourthFocusNode.requestFocus()
                                        : _secondFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _fourthCodeTextController,
                                  focusNode: _fourthFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _fifthFocusNode.requestFocus()
                                        : _thirdFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _fifthCodeTextController,
                                  focusNode: _fifthFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _sixthFocusNode.requestFocus()
                                        : _fourthFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _sixthCodeTextController,
                                  focusNode: _sixthFocusNode,
                                  onChanged: (value) {
                                    if (value.isEmpty)
                                      _fifthFocusNode.requestFocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                // Visibility(
                //     visible: otpVisibility,
                //     child: AppTextField(
                //       hint: "verify Code",
                //       prefixIcon: Icons.verified_user_outlined,
                //       textEditingController: _otpTextController,
                //       errorText: otpErrorText,
                //     )),


                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (otpVisibility) {
                        performActivatePhone();
                        //   verifyOTP();
                      } else {
                        loginWithPhone();
                      }
                    },
                    // onPressed: () => performLogin(),
                    // onPressed: () =>
                    //     Navigator.pushReplacementNamed(context, '/home_screen'),
                    child: TextApp(
                      text: LocaleKeys.signIn.tr(),
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 23.sp,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      minimumSize:  Size(270.w, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                //     SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: LocaleKeys.noAccount.tr(),
                          style: const TextStyle(color: blackColor, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                                text: LocaleKeys.signUp.tr(),
                                style: const TextStyle(
                                    color: Colors.blueAccent, fontSize: 20),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, "/register_screen");
                                  })
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => signInWithFacebook(),
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(facebookLoginIcon),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        signInWithGoogle();
                      },
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(googleLoginIcon),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signInWithFacebook() async {
    setState(() {
      isLoading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookCredential);

      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseService().auth.currentUser!.uid)
          .set({
        "email": userData['email'] ?? "",
        "imageURL": userData['picture']['data']['url'],
        "name": userData['name'],
      });

      Navigator.pushReplacementNamed(context, "/home_screen");
    } on FirebaseAuthException catch (e) {
      print("Error is: $e");
      var content = "";
      switch (e.code) {
        case "account-exists-with-different-credential":
          content = "This is account exist with a different sign in provider";
          break;
        case "invalid-credential":
          content = "Unknown error has occurred";
          break;
        case "operation-not-allowed":
          content = "This operation is not allowed";
          break;

        case "user-disabled":
          content = "The user you tried to log into is disabled";
          break;
        case "user-not-found":
          content = "The user you tried to log into was not found";
          break;
      }
      showAlertDialog(
          context: context,
          title: "Some think wrong",
          content: TextApp(text: content));
    }

    setState(() {
      isLoading = false;
    });
  }

  void signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseService().auth.currentUser!.uid)
          .set({
        "email": googleSignInAccount.email,
        "imageURL": googleSignInAccount.photoUrl,
        "name": googleSignInAccount.displayName,
      });

      Navigator.pushReplacementNamed(context, "/home_screen");
    } on FirebaseAuthException catch (e) {
      print("Error is: $e");
      var content = "";
      switch (e.code) {
        case "account-exists-with-different-credential":
          content = "This is account exist with a different sign in provider";
          break;
        case "invalid-credential":
          content = "Unknown error has occurred";
          break;
        case "operation-not-allowed":
          content = "This operation is not allowed";
          break;

        case "user-disabled":
          content = "The user you tried to log into is disabled";
          break;
        case "user-not-found":
          content = "The user you tried to log into was not found";
          break;
      }
      showAlertDialog(
          context: context,
          title: "Some think wrong",
          content: TextApp(text: content));
    }
  }

  void _onCountryChange(CountryCode code) async {
    setState(() {
      countryCode = code.toString();
    });
    print(countryCode);
  }

  void loginWithPhone() async {
    user.verifyPhoneNumber(
      phoneNumber: countryCode + _mobileTextController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await user.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;

        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> performActivatePhone() async {
    if (checkCode()) {
      await verifyOTP();
    }
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter Verification Code!',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text +
        _fifthCodeTextController.text +
        _sixthCodeTextController.text;
  }

  Future<void> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: _code);

    await user.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");
      showSnackBar(
          context: context,
          message: "You are logged in successfully",
          error: false);
      otpVisibility = false;

      Navigator.pushReplacementNamed(context, "/home_screen");

      FirebaseFirestore.instance.collection("users").doc(user.currentUser!.uid).set({

        "email": user.currentUser!.email ??"",
        "imageURL": "",
        "mobile_number": user.currentUser!.phoneNumber??"",
        "name": user.currentUser!.phoneNumber??"",

      });


    });
  }
}
