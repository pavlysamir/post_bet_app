import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/features/home/presentation/views/widgets/Custom_AppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(
              name: 'Bavly sa',
              image: 'd',
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Create a post',
                style: Styles.textStyle24BoldBlack,
              ),
            ),
            const Center(child: Text('home screen'))
          ],
        ),
      ),
    );
  }
}
