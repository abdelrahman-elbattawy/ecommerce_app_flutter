final class AppServerLinks {
  // Base Paths
  static const _baseUrl = "https://localhost/ecommerce";
  static const _authPath = "$_baseUrl/modules/auth";
  static const _profilePath = "$_baseUrl/modules/profile";

  // Auth
  static const verifyCode = "$_authPath/verifycode.php";
  static const register = "$_authPath/register.php";
  static const login = "$_authPath/login.php";
  static const forgotPassword = "$_authPath/forgot_password.php";
  static const verifyCodePassowrd = "$_authPath/verifycode_password.php";
  static const resetPassowrd = "$_authPath/reset_password.php";

  // Images
  static const _imagePath = "$_baseUrl/uploads";
  static const imageUserAvatar = "$_imagePath/users";
  static const imageCategoriesPath = "$_imagePath/categories";

  // Home
  static const _homePath = "$_baseUrl/modules/home";
  static const home = "$_homePath/home_page.php";

  // Profile
  static const deleteAccount = "$_profilePath/delete_account.php";
}
