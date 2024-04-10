import 'package:flutter/material.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/presentation/views/widgets/Custom_AppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHomeAppBar(
              name: 'Bavly sa',
              image: 'd',
            ),
            Center(child: Text('home screen'))
          ],
        ),
      ),
    );
  }
}
