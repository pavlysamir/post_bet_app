import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/core/Layouts/home_layout_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:post_bet/core/utils/widgets/custom_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              clipBehavior: Clip.antiAlias,
              notchMargin: 2,
              padding: EdgeInsets.zero,
              color: Colors.white,
              elevation: 0.0,
              shape: const CircularNotchedRectangle(),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                child: BottomNavigationBar(
                  mouseCursor: MouseCursor.defer,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.home,
                      ),
                      label: AppLocalizations.of(context)!.home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      label: AppLocalizations.of(context)!.menu,
                    ),
                  ],
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              ),
            ),
            floatingActionButton: const CustomBottomSheet(),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
