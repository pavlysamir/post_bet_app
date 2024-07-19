import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';
import 'package:post_bet/core/utils/widgets/custom_form_field.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';

class SchedulePostsScreen extends StatefulWidget {
  const SchedulePostsScreen({super.key});

  @override
  State<SchedulePostsScreen> createState() => _SchedulePostsScreenState();
}

class _SchedulePostsScreenState extends State<SchedulePostsScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.platform),
          ),
          body: Form(
            key: AddPostCubit.get(context).formSchadulaKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.history,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          textInputType: TextInputType.emailAddress,
                          hintText: '12/12/12',
                          controller: AddPostCubit.get(context)
                              .addSchadulaPostController,
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!.enterCode;
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: kPrimaryKey,
                        onPressed: () async {
                          selectedDate = await showDatePicker(
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: kPrimaryKey,
                                  colorScheme:
                                      const ColorScheme.light().copyWith(
                                    primary:
                                        kPrimaryKey, // Set your desired color here
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 365 * 20)),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365 * 20)),
                          );

                          if (selectedDate != null) {
                            setState(() {
                              AddPostCubit.get(context)
                                      .addSchadulaPostController
                                      .text =
                                  DateFormat.yMMMd().format(selectedDate!);
                              print(selectedDate);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          textInputType: TextInputType.datetime,
                          hintText: '-- : --',
                          controller: AddPostCubit.get(context)
                              .addSchadulaTimePostController,
                          validationMassage: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!.enterCode;
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.access_time_outlined),
                        color: kPrimaryKey,
                        onPressed: () async {
                          selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: kPrimaryKey,
                                  colorScheme:
                                      const ColorScheme.light().copyWith(
                                    primary:
                                        kPrimaryKey, // Set your desired color here
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (selectedTime != null) {
                            setState(() {
                              final now = DateTime.now();
                              final selectedDateTime = DateTime(
                                selectedDate?.year ?? now.year,
                                selectedDate?.month ?? now.month,
                                selectedDate?.day ?? now.day,
                                selectedTime!.hour,
                                selectedTime!.minute,
                              );
                              var formattedDateTime =
                                  DateFormat("yyyy-MM-ddTHH:mm:ssZ")
                                      .format(selectedDateTime.toUtc());
                              AddPostCubit.get(context)
                                      .addSchadulaTimePostController
                                      .text =
                                  DateFormat.jm().format(selectedDateTime);
                              print(formattedDateTime);
                              print(selectedDateTime);

                              // You can store the formattedDateTime string in your data model
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: CustomButtonSmall(
                      text: AppLocalizations.of(context)!.zip,
                      borderColor: kPrimaryKey,
                      function: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              PopUpDialogOneButton(
                            context: context,
                            function: () {
                              Navigator.pop(context);
                            },
                            title: 'تم الحفظ  ',
                            subTitle: '',
                            colorButton1: kPrimaryKey,
                            textColortcolor1: Colors.white,
                            textbtn: 'رجوع',
                          ),
                        );
                      },
                      color: kPrimaryKey,
                      textColortcolor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
