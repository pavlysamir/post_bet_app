import 'package:flutter/material.dart';

class CustomImgTempleteItem extends StatelessWidget {
  const CustomImgTempleteItem(
      {super.key, required this.img, required this.function});
  final String img;

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        //height: 150.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              //spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
