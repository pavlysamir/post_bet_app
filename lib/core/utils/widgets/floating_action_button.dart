import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.function});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: function,
        shape: const CircleBorder(),
        backgroundColor: kPrimaryKey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ));
  }
}
