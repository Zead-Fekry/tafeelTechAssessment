part of 'get_users_cubit.dart';

@immutable
abstract class GetUsersState {}

class GetUsersInitial extends GetUsersState {}

class GetUsersLoading extends GetUsersState {}

class GetUsersLoaded extends GetUsersState {
  final List<UserEntity> users;
  final bool isInitial;
  final bool hasMore;

  GetUsersLoaded({
    required this.users,
    required this.isInitial,
    required this.hasMore,
  });
}

class GetUsersError extends GetUsersState {
  final String message;

  GetUsersError({required this.message});
}
