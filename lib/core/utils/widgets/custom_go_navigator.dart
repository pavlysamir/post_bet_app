import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customGoAndDeleteNavigate(
    {required BuildContext context, required String path}) {
  GoRouter.of(context).pushReplacement(path);
}

void customJustGoNavigate(
    {required BuildContext context, required String path}) {
  GoRouter.of(context).push(path);
}
