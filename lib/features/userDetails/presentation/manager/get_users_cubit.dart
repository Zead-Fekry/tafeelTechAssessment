import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/faliures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/getAllUsers.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  final GetAllUsers getAllUsers;

  List<UserEntity> _allUsers = [];
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true;

  GetUsersCubit({required this.getAllUsers}) : super(GetUsersInitial());

  static GetUsersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchInitialUsers() async {
    _currentPage = 1;
    _allUsers = [];
    _hasMore = true;
    emit(GetUsersLoading());

    final result = await getAllUsers.call(_currentPage);
    emit(_handleResult(result, isInitial: true));
  }

  Future<void> fetchMoreUsers() async {
    if (_isFetching || !_hasMore) return;

    _isFetching = true;
    _currentPage++;

    final result = await getAllUsers.call(_currentPage);
    emit(_handleResult(result, isInitial: false));

    _isFetching = false;
  }

  GetUsersState _handleResult(Either<Failure, List<UserEntity>> result, {required bool isInitial}) {
    return result.fold(
          (failure) {
        return GetUsersError(message: _mapFailureToMessage(failure));
      },
          (newUsers) {
        if (newUsers.isEmpty) {
          _hasMore = false;
        } else {
          _allUsers.addAll(newUsers);
        }

        return GetUsersLoaded(users: _allUsers, isInitial: isInitial, hasMore: _hasMore);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server failure. Try again.";
      case OfflineFailure:
        return "No internet connection.";
      default:
        return "Unexpected error. Please try again.";
    }
  }
}
