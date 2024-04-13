final class AppServerLinks {
  // Base Path
  static const _baseUrl = "https://localhost/ecommerce";

  // Auth
  static const _authPath = "$_baseUrl/modules/auth";
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
  static const imageItemsPath = "$_imagePath/items";

  // Home
  static const _homePath = "$_baseUrl/modules/home";
  static const home = "$_homePath/home_page.php";
  static const itemsPage = "$_homePath/items_page.php";

  // Favorite
  static const _favoritePath = "$_baseUrl/modules/favorite";
  static const addFavorite = "$_favoritePath/add_favorite.php";
  static const removeFavorite = "$_favoritePath/remove_favorite.php";

  // Profile
  static const _profilePath = "$_baseUrl/modules/profile";
  static const deleteAccount = "$_profilePath/delete_account.php";
  static const uploadAvatar = "$_profilePath/upload_avatar.php";
  static const updateAccountInfo =
      "$_profilePath/upload_personal_informations.php";
  static const updatePassword = "$_profilePath/update_password.php";

  // Cart
  static const _cartPath = "$_baseUrl/modules/cart";
  static const addCart = "$_cartPath/add_cart.php";
  static const removeCart = "$_cartPath/remove_cart.php";
}
