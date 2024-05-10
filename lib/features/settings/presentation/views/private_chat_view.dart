import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/chat_recieve_bubble.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/chat_send_bubble.dart';
import 'package:post_bet/generated/l10n.dart';

class PrivateChat extends StatelessWidget {
  const PrivateChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<MessageModel> messages= [];
    final controller = ScrollController();
    var messageController = TextEditingController();

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SendContactUsSuccess) {
          SettingsCubit.get(context).getContactUsMessage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).helpCenter,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          body: state is GetContactUsSuccess || state is SendContactUsSuccess
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: controller,
                        itemCount: SettingsCubit.get(context).messages.length,
                        itemBuilder: (context, index) {
                          return SettingsCubit.get(context)
                                      .messages[index]
                                      .replyMessage ==
                                  null
                              ? ChatSendBubble(
                                  message: SettingsCubit.get(context)
                                      .messages[index]
                                      .message,
                                )
                              : ChatReceiveBubble(
                                  message: SettingsCubit.get(context)
                                      .messages[index]
                                      .replyMessage!,
                                );
                        },
                        shrinkWrap: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormField(
                          controller: messageController,
                          validationMassage: (value) {},
                          hintText: 'send',
                          suffixIcon: IconButton(
                              onPressed: () async {
                                await SettingsCubit.get(context)
                                    .sendContactUsMessage(
                                        message: messageController.text,
                                        email: getIt
                                            .get<CashHelperSharedPreferences>()
                                            .getData(key: ApiKey.email));
                                messageController.clear();
                              },
                              icon: const Icon(Icons.send)),
                          textInputType: TextInputType.name),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryKey,
                )),
        );
      },
    );
  }

  // void clickToSendMessage(TextEditingController messageController,
  //     BuildContext context, String? token, ScrollController controller) {
  //   messageController.text.isEmpty
  //       ? null
  //       : ChatCubit.get(context).sendMessage(
  //           receiverId: postModel != null ? postModel!.uId! : userModel!.uId!,
  //           dateTime: DateTime.now().toString(),
  //           text: messageController.text,
  //         );
  //   NotificationCubit.get(context).createNotification(
  //       postModel != null ? postModel!.uId! : userModel!.uId!);
  //   token != null
  //       ? LocalNotificationServices.sendNotification(
  //           token: token,
  //           title: 'New Message',
  //           message:
  //               '${getIt.get<CashHelperSharedPreferences>().getData(key: 'userName') ?? ''}  : ${messageController.text}',
  //           type: 'chat',
  //         )
  //       : null;

  //   messageController.clear();
  //   controller.animateTo(controller.position.maxScrollExtent,
  //       duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  // }
}
