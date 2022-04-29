import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/FirebaseServices/google_sign_in_services.dart';
import 'package:inpaket/helpers/snack_bar_helpers.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/app_text_field.dart';
import 'package:inpaket/widgets/text_app.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with SnackBarHelpers {
  late FirebaseService _firebaseService;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _cityTextController;
  late TextEditingController _emailTextController;
  String? _nameErrorText;
  String? _phoneErrorText;
  String? _cityErrorText;
  String? _emailErrorText;

  File? _image;
  String imageUrl = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _phoneTextController.dispose();
    _cityTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: TextApp(
            text: LocaleKeys.updateProfile.tr(),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        children: [
          InkWell(
            onTap: () => _openImagePicker(),
            child: _image != null
                ? CircleAvatar(
                    minRadius: 80.sp,
                    maxRadius: 100.sp,
                    foregroundImage: FileImage(
                      _image!,
                    ),
                  )
                : CircleAvatar(
                    minRadius: 80.sp,
                    maxRadius: 100.sp,
                    child: Image.asset(addImage),
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            textEditingController: _nameTextController,
            obscureText: false,
            prefixIcon: Icons.person,
            hint: LocaleKeys.fullName.tr(),
            errorText: _nameErrorText,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 24.h),
          AppTextField(
            textEditingController: _phoneTextController,
            obscureText: false,
            prefixIcon: Icons.phone,

            hint: LocaleKeys.enterMobile.tr(),
            errorText: _phoneErrorText,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 24.h),
          AppTextField(
            textEditingController: _emailTextController,
            obscureText: false,
            prefixIcon: Icons.email,
            hint: LocaleKeys.enterMobile.tr(),
            errorText: _emailErrorText,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 24.h),
          AppTextField(
            textEditingController: _cityTextController,
            obscureText: false,
            prefixIcon: Icons.location_city,
            hint: LocaleKeys.city.tr(),
            errorText: _cityErrorText,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 50.h),
       isLoading == false ?   ElevatedButton(
              onPressed: () {
                performUpdateProfile();
              },
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: const Size(0, 50),
                elevation: 15,
              ),
              child: Text(
                "Update",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              )): const Center(child: CircularProgressIndicator(),)
        ],
      ),
    );
  }

  Future performUpdateProfile() async {


    setState(() {
      isLoading = true;
    });
    if (checkData()) {
      await updateProfile();
    }

    setState(() {
      isLoading = false;
    });
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty ||
        imageUrl != "" ||
        _emailTextController.text.isNotEmpty ||
        _cityTextController.text.isNotEmpty ||
        _phoneTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, message: "Check data required", error: true);

    return false;
  }

  Future updateProfileData(String img) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(_firebaseService.user?.uid)
        .update({
      "email": _emailTextController.text.trim(),
      "mobile_number": _phoneTextController.text.trim(),
      "name": _nameTextController.text.trim(),
      "city": _cityTextController.text.trim(),
      "imageURL": img,
// "":"",
    });
  }

  Future<String> uploadImageToFirebaseStorage(File image) async {
    String fileName = path.basename(image.path);

    var reference =
        FirebaseStorage.instance.ref().child('profileImages/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageUrl = value;
      print(" $value");
    }).catchError((e) {
      print("Error happen $e");
    });

    return imageUrl;
  }

  Future updateProfile() async {

    String imgURL = await uploadImageToFirebaseStorage(_image!);
    updateProfileData(imgURL);
  }

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
