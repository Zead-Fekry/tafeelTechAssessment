import 'package:dio/dio.dart';
import '../../../userDetails/data/models/user_model.dart';
abstract class UserRemoteDatasource {
  Future<UserModel> getUser(int id);
}

class UserRemoteDatasourceImplWithDio implements UserRemoteDatasource {
  final Dio dio;

  UserRemoteDatasourceImplWithDio({Dio? dio})   : dio = dio ?? Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  @override
  Future<UserModel> getUser(int id) async {
    try {
      final response = await dio.get('https://reqres.in/api/users', queryParameters: {'id': id},);

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return UserModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch user: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }
}
