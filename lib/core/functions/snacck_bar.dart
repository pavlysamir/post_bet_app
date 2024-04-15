import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context, String message = 'welcome to Yappy',required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message,style:const TextStyle(color: Colors.white),),
      duration:const Duration(seconds: 2),
    ),
  );
}