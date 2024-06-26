import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/utlis/app_middleware.dart';
import 'package:ecommerce_app/features/auth/views/forgot_password_view.dart';
import 'package:ecommerce_app/features/auth/views/login_view.dart';
import 'package:ecommerce_app/features/auth/views/register_view.dart';
import 'package:ecommerce_app/features/auth/views/reset_password_view.dart';
import 'package:ecommerce_app/features/auth/views/verify_code_view.dart';
import 'package:ecommerce_app/features/home/views/categories_gride_view.dart';
import 'package:ecommerce_app/features/home/views/home_view.dart';
import 'package:ecommerce_app/features/home/views/item_details_view.dart';
import 'package:ecommerce_app/features/home/views/items_gride_view.dart';
import 'package:ecommerce_app/features/language/views/language_view.dart';
import 'package:ecommerce_app/features/onBoarding/views/onboarding_view.dart';
import 'package:ecommerce_app/features/search/views/search_view.dart';
import 'package:ecommerce_app/features/splash/views/splash_view.dart';
import 'package:ecommerce_app/features/success/views/success_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final getPages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashView(),
  ),
  GetPage(
    name: AppRoutes.language,
    page: () => const LanguageView(),
    middlewares: [AppMiddleWare()],
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoadingView(),
  ),

  // Auth
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginView(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterView(),
  ),
  GetPage(
    name: AppRoutes.forgotPassword,
    page: () => const ForgotPasswordView(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCodeView(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordView(),
  ),
  GetPage(
    name: AppRoutes.successView,
    page: () => const SuccessView(),
  ),

  // Home
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeView(),
  ),
  GetPage(
    name: AppRoutes.categories,
    page: () => const CategoriesGrideView(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsGrideView(),
  ),
  GetPage(
    name: AppRoutes.itemDetails,
    page: () => const ItemDetailsView(),
  ),
  GetPage(
    name: AppRoutes.searchView,
    page: () => const SearchView(),
  ),
];
