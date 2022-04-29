import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hint;
  final bool obscureText;
  final Color textColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;

  AppTextField({
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textColor = Colors.black,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.none,
      keyboardType: textInputType,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      controller: textEditingController,

      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.zero,
        hintText: hint,
        hintMaxLines: 1,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        enabled: true,
        disabledBorder: getBorder(borderColor: Colors.red.shade200),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(borderColor: Colors.blue),
        errorText: errorText,
        errorMaxLines: 1,
        errorBorder: getBorder(borderColor: Colors.red),
        focusedErrorBorder: getBorder(borderColor: Colors.red.shade800),
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );
  }
}

Widget textField(
    {text,
    TextEditingController? controller,
    Function? validator,
    TextInputType inputType = TextInputType.text}) {
  return Container(
    height: 48,
    margin: EdgeInsets.only(bottom: Get.height * 0.02),
    child: TextFormField(
      keyboardType: inputType,
      controller: controller,
      validator: (input) => validator!(input),
      decoration: InputDecoration(
          hintText: text,
          errorStyle: TextStyle(fontSize: 0),
          contentPadding: EdgeInsets.only(top: 10, left: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    ),
  );
}

Widget elevatedButton({text, Function? onpress}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    ),
    onPressed: () {
      onpress!();
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
