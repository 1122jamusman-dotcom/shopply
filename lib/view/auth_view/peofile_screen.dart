import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widgets/textformfield_component.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          SizedBox(width: 10),
          Text(
            'Save',
            style: theme.textTheme.displaySmall!.copyWith(
              color: AppColors.error,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(AppImages.favourite3),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mark Hanery', style: theme.textTheme.displayMedium),
                  Icon(Icons.edit_outlined),
                ],
              ),

              Text(
                'Email',
                style: theme.textTheme.displaySmall!.copyWith(fontSize: 15),
              ),
              SizedBox(height: 15),
              TextformFieldComponent(
                prefixIcon: Icons.email,

                controller: Emailcontroller,
                hintText: ' abc@gmail.com',
              ),

              SizedBox(height: 30),
              Text(
                'About',
                style: theme.textTheme.displaySmall!.copyWith(fontSize: 15),
              ),
              SizedBox(height: 15),
              TextformFieldComponent(
                prefixIcon: Icons.password,
                controller: Emailcontroller,
                hintText:
                    ' I’m a passionate writer who believes in the power of words to inspire, entertain, and transform lives. Writing allows me to explore the depths of imagination and emotion, crafting stories that connect with readers on a personal level. Each book I create is a journey — one that invites readers to see the world through a different lens.',
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
