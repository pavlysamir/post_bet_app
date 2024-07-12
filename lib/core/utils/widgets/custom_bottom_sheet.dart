import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/floating_action_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      function: () {
        customJustGoNavigate(context: context, path: AppRouter.kAddPostView);
      },
    );
  }
}
