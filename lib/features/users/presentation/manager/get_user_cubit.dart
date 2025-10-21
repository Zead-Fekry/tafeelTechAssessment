import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/faliures.dart';
import '../../../userDetails/domain/entities/user_entity.dart';
import '../../domain/use_cases/get_user.dart';

part 'get_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUser getSingleUser;

  GetSingleUserCubit({required this.getSingleUser}) : super(GetSingleUserInitial());

  Future<void> fetchUser(int id) async {
    emit(GetSingleUserLoading());

    final result = await getSingleUser(id);

    result.fold(
          (failure) => emit(GetSingleUserError(_mapFailureToMessage(failure))),
          (user) => emit(GetSingleUserLoaded(user)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure. Try again.';
      case OfflineFailure:
        return 'No internet connection.';
      default:
        return 'Unexpected error. Please try again.';
    }
  }
}
