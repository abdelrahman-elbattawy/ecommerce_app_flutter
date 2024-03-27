final class AppServerLinks {
  static const _baseUrl = "https://localhost/ecommerce";

  // Auth
  static const verifyCode = "$_baseUrl/modules/auth/verifycode.php";
  static const register = "$_baseUrl/modules/auth/register.php";
  static const login = "$_baseUrl/modules/auth/login.php";
  static const forgotPassword = "$_baseUrl/modules/auth/forgot_password.php";
  static const verifyCodePassowrd =
      "$_baseUrl/modules/auth/verifycode_password.php";
  static const resetPassowrd = "$_baseUrl/modules/auth/reset_password.php";

  // Images
  static const userAvatar = "$_baseUrl/uploads/users";
}
