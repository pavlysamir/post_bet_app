part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class HomeChaneNavBar extends HomeLayoutState {}

class themeChangeMode extends HomeLayoutState {
  final bool isDark;
  themeChangeMode({required this.isDark});
}
