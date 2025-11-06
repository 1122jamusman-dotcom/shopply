import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/login_screen.dart';
import 'package:shoply/widget/butten_widget.dart';

class OnbordingScreen extends StatefulWidget {
  OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _controller = PageController();

  int _Currentpage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400.h,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _Currentpage = index;
                  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                  print(index);
                });
              },
              children: [
                Container(
                  height: 50.h,
                  width: 200.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Image.asset(AppImages.onbording1, fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Image.asset(AppImages.onbording1),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Image.asset(AppImages.onbording1),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          DotsIndicator(
            dotsCount: 3,
            position: _Currentpage.toDouble(),

            decorator: DotsDecorator(
              activeColor: Color.fromARGB(
                255,
                218,
                120,
                21,
              ), // same color for all pages
              color: Colors.grey, // inactive dots
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
            ),
            onTap: (position) {
              _controller.animateToPage(
                position.toInt(),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Read your favourite books',
              style: theme.textTheme.displaySmall,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'All your favourites book in one place, read any book, staying at home, on travelling, or anywhere else',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 130.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ButtonWidget(
              hinttext: _Currentpage < 2 ? 'Continue' : 'Get Started',
              onTap: () {
                if (_Currentpage < 2) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else if (_Currentpage == 2) {
                  Get.to(LoginScreen());
                  print('3 ');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
