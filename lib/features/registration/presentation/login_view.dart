import 'package:flutter/material.dart';
import 'package:post_bet/core/Assets/Assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(AssetsData.loginLogo)],
    );
  }
}
