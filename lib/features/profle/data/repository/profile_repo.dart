import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {

  //! Change Password
  Future<Either<String, String>> changePassword({
    required String oldPass,
    required String newPass,
    required String confirmPassword,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoints.passChange,
        data: {
          "oldPass": oldPass,
          "newPass": newPass,
          "confirmPassword": confirmPassword,
        },
      );
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Edit Profile
}
