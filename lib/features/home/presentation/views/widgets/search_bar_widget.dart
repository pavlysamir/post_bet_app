import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchBar(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        padding:
            const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
        leading: Icon(
          Icons.search,
          size: 32.dg,
          color: kPrimaryKey,
        ),
        autoFocus: false,
        hintText: 'بحث عن ....',
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.grey),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: onChanged,
      ),
    );
  }
}
