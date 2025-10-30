import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/login_screen.dart';
import 'package:shoply/widgets/button_component.dart';

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
            height: 400,
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
                  height: 50,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(AppImages.onbording1, fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset(AppImages.onbording1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset(AppImages.onbording1),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          DotsIndicator(
            dotsCount: 3,
            position: _Currentpage.toDouble(),
            decorator: const DotsDecorator(
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
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
          SizedBox(height: 20),
          Text(
            'Read your favourite books',
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'All your favourites book in one place, read any book, staying at home, on travelling, or anywhere else',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ButtonComponent(
              hinttext: _Currentpage < 2 ? 'Continue' : 'Get Started',
              ontap: () {
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
