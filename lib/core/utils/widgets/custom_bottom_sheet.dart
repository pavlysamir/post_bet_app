import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/widgets/floating_action_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      function: () {
        showModalBottomSheet(
          isDismissible: true,
          enableDrag: true,
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(
                    context); // Close the bottom sheet when tapped outside
              },
              child: Padding(
                  padding: const EdgeInsets.all(13.0), child: Container()),
            );
          },
        );
      },
    );
  }
}
