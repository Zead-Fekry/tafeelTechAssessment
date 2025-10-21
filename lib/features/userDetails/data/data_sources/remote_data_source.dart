import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class UsersRemoteDatasource {
  Future<List<UserModel>> getAllUsers(int page);
}

class UsersRemoteDatasourceImplWithDio implements UsersRemoteDatasource {
  final Dio dio;

  UsersRemoteDatasourceImplWithDio({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<List<UserModel>> getAllUsers(int page) async {
    try {
      final response = await dio.get('https://reqres.in/api/users?page=$page');

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }
}
