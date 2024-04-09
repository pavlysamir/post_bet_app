import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import '../data/models/onBoeding_model.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key, required this.model});
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('${model.image}'),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
        ),
        const SizedBox(
          height: 10,
        ),
        Text('${model.title}',
            style: Styles.textStyle32Black, textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Text(
            '${model.messege}',
            style: Styles.textStyle14,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
