import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsview extends StatelessWidget {
  const AboutUsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbareWithTitle(title: AppLocalizations.of(context)!.aboutUs),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          AppLocalizations.of(context)!.aboutUsContant,
          style: Theme.of(context).textTheme.bodyLarge,
        )),
      ),
    );
  }
}
