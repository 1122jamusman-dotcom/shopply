import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/utils/app_colors.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 70.w),
                    Center(
                      child: Text(
                        'Catcher in the Rye',
                        style: theme.textTheme.headlineMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'JD Slinger',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 20.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pencey ',

                        style: theme.textTheme.headlineMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      TextSpan(
                        text:
                            'is   Holdens  fourth  school; he has already failed out of three others.At  Pencey, he has  failed four  out  of  five of  his classes and  has  received notice   that   he is   being expelled,  but  he  is  not scheduled  to return home  to  Manhattan  until  Wedne-sday. He visits his  elderly history teacher, Spencer, to say   goodbye,  but    when  Spencer  tries  to reprimand him  for his poor  academic perfo rm ance, Holden becomes annoyed. Back in the dorm itory,  Holden is further  irritated by his unhygienic neighbor, Ackley, and by his own  roommate,  Strad later.Stradlater  spends   the  evening   on a  date with   Jane  Gallagher, a   girl  whom  Holden used  to  date  and  whom  he   still  admires. During  the   course  of  the   evening, Holden grows increasingly nervous about Stradlater ’s   taking   Jane   out,   and   when Stradlater returns,  Holden   questions   him  insist ently about whether he tried to  have sex with her. Stradlater   teases  Holden,  who  flies  into  a rage and attacks  Stradlater. Stradlater pins Holden down and  bloodies his nose. Holden decides   that  he’s  enough  of  Pencey  and  will goand bloodies his nose.Holden decides that  he’s  enough  of  Pencey  and  will go and  bloodies his nose. Holden decides  that  he’s  enough  of  Pencey  and  will go   ',

                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
