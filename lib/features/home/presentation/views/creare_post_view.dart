import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/Custom_AppBar_with_title.dart';
import 'package:post_bet/core/utils/widgets/custom_button_large.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/views/widgets/custom_description_post_field.dart';
import 'package:post_bet/generated/l10n.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppbareWithTitle(title: S.of(context).createPost),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: CustomButtonLarge(
                    text: S.of(context).share,
                    color: kPrimaryKey,
                    textColor: Colors.white,
                    function: () {}),
              ),
              body: Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomDescriptionPostField(
                        controller: AddPostCubit.get(context).addPostController,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return 'please write anything';
                          }
                        },
                        hintText: S.of(context).typeAnyThing,
                        textInputType: TextInputType.text),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
