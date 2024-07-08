import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/core/Layouts/home_layout_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.subscriptions_outlined,
                    ),
                    label: AppLocalizations.of(context)!.subscribe,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.horizontal_split_rounded,
                    ),
                    label: AppLocalizations.of(context)!.platform,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.menu,
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
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
