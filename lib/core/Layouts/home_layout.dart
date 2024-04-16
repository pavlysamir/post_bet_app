import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/core/Layouts/home_layout_cubit.dart';
import '../../../../../generated/l10n.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(85.h),
            //   child: const SafeArea(
            //     child: CustomAppBar(
            //       name: 'Your Name',
            //       image: 'Your Image',
            //     ),
            //   ),
            // ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                mouseCursor: MouseCursor.defer,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                    label: S.of(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                    label: S.of(context).activities,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.horizontal_split_rounded,
                    ),
                    label: S.of(context).platform,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    label: S.of(context).settings,
                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
