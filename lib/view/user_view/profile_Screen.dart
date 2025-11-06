import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controllar/user_%20information%20_controllar.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController aboutcontroller = TextEditingController();

  final UserInfoControler userInfoControler = Get.put(UserInfoControler());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfoControler.fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 10.w),
          Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: Text(
              'Save',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.error,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (userInfoControler.userInfo.value == null) {
          return Center(child: Text('Please wait'));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 100.w),
                    child: CircleAvatar(
                      radius: 80.r,
                      backgroundImage: NetworkImage(
                        userInfoControler.userInfo.value!.profileImage,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userInfoControler.userInfo.value!.name,
                        style: theme.textTheme.displayMedium,
                      ),
                      Icon(Icons.edit_outlined),
                    ],
                  ),

                  Text(
                    'Email',
                    style: theme.textTheme.displaySmall!.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 15),
                  TextFormfieldWidget(
                    hintText: userInfoControler.userInfo.value!.email,
                    controllar: emailcontroller,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'About',
                    style: theme.textTheme.displaySmall!.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 15),
                  TextFormfieldWidget(
                    hintText: userInfoControler.userInfo.value!.about,
                    controllar: aboutcontroller,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
