part of 'get_user_cubit.dart';
@immutable
abstract class GetSingleUserState {}

class GetSingleUserInitial extends GetSingleUserState {}

class GetSingleUserLoading extends GetSingleUserState {}

class GetSingleUserLoaded extends GetSingleUserState {
  final UserEntity user;

  GetSingleUserLoaded(this.user);
}

class GetSingleUserError extends GetSingleUserState {
  final String message;

  GetSingleUserError(this.message);
}
