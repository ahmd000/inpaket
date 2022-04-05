import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/prefs/shared_pref_controller.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/out_boarding_contents/out_boarding_content1.dart';
import 'package:inpaket/widgets/out_boarding_contents/out_boarding_content2.dart';
import 'package:inpaket/widgets/out_boarding_contents/out_boarding_content3.dart';
import 'package:inpaket/widgets/out_boarding_indicator.dart';
import 'package:inpaket/widgets/text_app.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () => SharedPrefController().loggedIn == true
                      ? Navigator.pushReplacementNamed(context, '/home_screen')
                      : Navigator.pushReplacementNamed(
                          context, '/login_screen'),
                  child: TextApp(
                    text: LocaleKeys.start.tr(),
                    fontColor: gradingColor1,
                    fontSize: 20.sp,
                  ),
                ),
                child: TextButton(
                  onPressed: () => _pageController.animateToPage(
                    2,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  child: TextApp(
                    text: LocaleKeys.skip.tr(),
                    fontColor: gradingColor1,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
                minHeight: 0,
                maxHeight: 500,
              ),
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: const [
                  OutBoardingContent1(),
                  OutBoardingContent2(),
                  OutBoardingContent3(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _currentPage > 0,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _currentPage > 0
                          ? Colors.amber.shade900
                          : gradingColor1,
                    ),
                  ),
                ),
                Visibility(
                  visible: _currentPage < 2,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,);
                    },
                    icon:  Icon(Icons.arrow_forward_ios, color: _currentPage > 0
                        ? Colors.amber.shade900
                        : gradingColor1,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                    marginEnd: 10, selected: _currentPage == 0),
                OutBoardingIndicator(
                    marginEnd: 10, selected: _currentPage == 1),
                OutBoardingIndicator(selected: _currentPage == 2),
              ],
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _currentPage == 2,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login_screen'),
                  child:  TextApp(text:LocaleKeys.start.tr(), fontColor: gradingColor1, fontSize: 25.sp,),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
