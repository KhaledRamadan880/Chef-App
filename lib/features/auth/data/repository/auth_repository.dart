import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.signIn, data: {
        ApiKey.email = email,
        ApiKey.password = password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}