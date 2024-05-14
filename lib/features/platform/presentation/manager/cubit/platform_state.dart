part of 'platform_cubit.dart';

@immutable
sealed class PlatformState {}

final class PlatformInitial extends PlatformState {}

final class LinkAcoountLoading extends PlatformState {}

final class LinkAcoountSuccess extends PlatformState {}

final class LinkAcoountFailure extends PlatformState {
  final String errMessage;

  LinkAcoountFailure({required this.errMessage});
}
