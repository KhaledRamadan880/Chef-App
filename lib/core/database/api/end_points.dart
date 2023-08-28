class EndPoints {
  static const baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const signIn = 'chef/signin';
  static const chefGEt = 'chef/get-chef/';
  static const sendCode = 'chef/send-code';
  static const forgetPassChange = 'chef/change-forgotten-password';
  static const passChange = 'chef/change-password';
  static const update = 'chef/update';
  static const addMeal = 'meal/add-to-menu';
  static const updateMeal = 'chef/update-meal/';
  static const deleteMEal = 'meal/delete-meal/';
  static const getAllMeal = 'meal/get-meals';
  static const logout = 'chef/logout';

  static String chefGetEndPoint(id) {
    return '$chefGEt$id';
  }
  static String updateMealEndPoint(id) {
    return '$updateMeal$id';
  }
  static String deleteMealEndPoint(id) {
    return '$updateMeal$id';
  }
}

class ApiKey{
  static const String email = "email";
  static const String password = "password";
  static const String oldPass = "oldPass";
  static const String newPass = "password";
  static const String confirmPassword = "confirmPassword";
  static const String code = "code";
}
