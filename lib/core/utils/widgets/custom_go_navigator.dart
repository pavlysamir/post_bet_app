import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customGoNavigate({required BuildContext context, required String path}) {
  GoRouter.of(context).pushReplacement(path);
}
