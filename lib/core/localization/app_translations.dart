import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:get/route_manager.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "AR": {
          // Language View
          AppTranslationsKeys.languageTitle: "اختر اللغة",
          AppTranslationsKeys.languageButtonText: "انتقل الي الصفحة الرئيسية",

          // OnBoarding View
          AppTranslationsKeys.onBoardingButtonText: "التالي",
          AppTranslationsKeys.onBoardingTitleOne: "اختر المنتج",
          AppTranslationsKeys.onBoardingTitleTwo: "دفع سهل وآمن",
          AppTranslationsKeys.onBoardingTitleThree: "أتبع طلبك",
          AppTranslationsKeys.onBoardingTitleFour: "توصيل سريع",
          AppTranslationsKeys.onBoardingBodyOne:
              ".لدينا 100 ألف منتج\n اختر المنتج الخاص بك من متجر التجارة\n الإلكترونية الخاص بنا",
          AppTranslationsKeys.onBoardingBodyTwo:
              "طريقة الدفع السهلة والدفع الآمن\n.موثوق به من قبل عملائنا\n .من جميع أنحاء العالم",
          AppTranslationsKeys.onBoardingBodyThree:
              "تم استخدام أفضل أداة تعقب\n لتتبع طلبك. ستعرف مكان\n .منتجك في الوقت الحالي",
          AppTranslationsKeys.onBoardingBodyFour:
              "تسليم موثوق وسريع. نحن\n نقوم بتسليم منتجك بأسرع\n .طريقة ممكنة",

          // Login View
          AppTranslationsKeys.loginTitle: "تسجيل الدخول",
          AppTranslationsKeys.loginHeaderOne: "مرحبًا بعودتك",
          AppTranslationsKeys.loginHeadterTwo:
              "قم بتسجيل الدخول باستخدام بريدك الإلكتروني\n أو تابع باستخدام وسائل التواصل الاجتماعي",
          AppTranslationsKeys.loginEmailLabel: "البريد الالكتروني",
          AppTranslationsKeys.loginEmailHint: "ادخل البريد الالكتروني",
          AppTranslationsKeys.loginPasswordLabel: "كلمة المرور",
          AppTranslationsKeys.loginPasswordHint: "ادخل كلمة المرور",
          AppTranslationsKeys.loginRememberMe: "تذكرنى",
          AppTranslationsKeys.loginForgotPassword: "هل نسيت كلمة المرور؟",
          AppTranslationsKeys.loginButtonText: "تسجيل الدخول",
          AppTranslationsKeys.loginDontHaveAccount: "ليس لديك حساب؟ ",
          AppTranslationsKeys.loginSignUpLabel: "التسجيل",

          // Register View
          AppTranslationsKeys.registerTitle: "التسجيل",
          AppTranslationsKeys.registerHeaderOne: "الملف الشخصي",
          AppTranslationsKeys.registerHeaderTwo:
              "أكمل التفاصيل الخاصة بك أو تابع باستخدام وسائل التواصل الاجتماعي",
          AppTranslationsKeys.registerEmailLabel: "البريد الالكتروني",
          AppTranslationsKeys.registerEmailHint: "ادخل البريد الالكتروني",
          AppTranslationsKeys.registerPasswordLabel: "كلمة المرور",
          AppTranslationsKeys.registerPasswordHint: "ادخل كلمة المرور",
          AppTranslationsKeys.registerButtonText: "التسجيل",
          AppTranslationsKeys.registerHaveAccount: "هل لديك حساب؟ ",
          AppTranslationsKeys.registerSignInLabel: "تسجيل الدخول",
          AppTranslationsKeys.registerUsernameLabel: "اسم المستخدم",
          AppTranslationsKeys.registerUsernameHint: "ادخل اسم المستخدم",
          AppTranslationsKeys.registerPhoneLabel: "رقم الهاتف",
          AppTranslationsKeys.registerPhoneHint: "ادخل رقم الهاتف",

          // Forgot Password View
          AppTranslationsKeys.forgotPasswordHeaderOne: "هل نسيت كلمة السر؟",
          AppTranslationsKeys.forgotPasswordHeaderTwo:
              "لا تقلق! الرجاء إدخال البريد الإلكتروني المرتبط.\n سنرسل لك تعليمات إعادة التعيين.",
          AppTranslationsKeys.forgotPasswordEmailLabel: "البريد الالكتروني",
          AppTranslationsKeys.forgotPasswordEmailHint: "ادخل البريد الالكتروني",
          AppTranslationsKeys.forgotPasswordButtonText: "ارسال",

          // Verify Code View
          AppTranslationsKeys.verifyCodeHeaderOne:
              "التحقق من البريد الإلكتروني الخاص بك",
          AppTranslationsKeys.verifyCodeHeaderTwo:
              "أرسلنا رمزًا مكونًا من 5 أرقام إلى\n",
          AppTranslationsKeys.verifyCodeButtonText: "تاكيد",
          AppTranslationsKeys.verifyCodeDontReceive:
              "لم يصل لك البريد الالكتروني؟ ",
          AppTranslationsKeys.verifyCodeResendLabel: "إعادة إرسال",

          // Reset Password View
          AppTranslationsKeys.resetPasswordHeaderOne: "إعادة تعيين كلمة المرور",
          AppTranslationsKeys.resetPasswordHeaderTwo:
              "الرجاء التأكد من أن كلمة المرور الجديدة\n يجب أن تكون مختلفة عن كلمات المرور المستخدمة سابقًا.",
          AppTranslationsKeys.resetPasswordPassLabel: "كلمة المرور",
          AppTranslationsKeys.resetPasswordPassHint: "ادخل كلمة المرور",
          AppTranslationsKeys.resetRePasswordPassLabel: "تاكيد كلمة المرور",
          AppTranslationsKeys.resetRePasswordPassHint: "ادخل كلمة المرور",
          AppTranslationsKeys.resetPasswordButtonText:
              "إعادة تعيين كلمة المرور",

          // Success View
          AppTranslationsKeys.successViewButtonText:
              "انتقل الي الصفحة الرئيسية",
          AppTranslationsKeys.successViewLabel: "بنجاح",
          AppTranslationsKeys.successViewText1:
              "تم إعادة تعيين كلمة المرور الخاصة بك",
          AppTranslationsKeys.successViewText2: "لقد تم تأكيد بريدك الإلكتروني",

          // Valid Input
          AppTranslationsKeys.userNameValid: "اسم مستخدم غير صالح",
          AppTranslationsKeys.phoneNumberValid: "رقم الهاتف غير صالح",
          AppTranslationsKeys.emailValid: "بريد إلكتروني غير صالح",
          AppTranslationsKeys.emptyValid: "لا يمكن أن تكون فارغة",
          AppTranslationsKeys.minValid: "لا يمكن أن يكون أقل من",
          AppTranslationsKeys.maxValid: "لا يمكن أن يكون أكبر من",
          AppTranslationsKeys.passwordMatchValid: "كلمة المرور غير متطابقة",

          // Api Service
          AppTranslationsKeys.validInternet:
              "تحقق من الإنترنت لديك، يرجى المحاولة مرة أخرى",
          AppTranslationsKeys.validGeneral:
              "عفوًا، حدث خطأ، يرجى المحاولة مرة أخرى",

          // Snack Bar
          AppTranslationsKeys.snackBarSuccessLabel: "تهنئة!",
          AppTranslationsKeys.snackBarBarErrorLabel: "هناك خطأ ما!",
          AppTranslationsKeys.snackBarBarWarringLabel: "تحـذير!",
          AppTranslationsKeys.snackBarRegisterSuccess: "تم التسجيل بنجاح!",
          AppTranslationsKeys.snackBarVerifyCodeSuccess: "تم التحقق بنجاح!",
          AppTranslationsKeys.snackBarLoginSuccess: "تم تسجيل الدخول بنجاح!",
          AppTranslationsKeys.snackBarResetPasswordSuccess:
              "تم إعادة تعيين كلمة المرور بنجاح!",
          AppTranslationsKeys.snackBarDeleteAccountSuccess:
              "لقد تم حذف حسابك بنجاح!",

          // Home View
          AppTranslationsKeys.homeViewSeachHint: "بحث",
          AppTranslationsKeys.homeViewCategoriesLabel: "الاقسام",
          AppTranslationsKeys.homeViewSeeAllLabel: "المزيد",
          AppTranslationsKeys.homeViewTodayOffersLabel: "عروض اليوم",
          AppTranslationsKeys.homeViewRecommendedLabel: "من اجلك",
          AppTranslationsKeys.homeViewAllLabel: "الكل",

          // Home Tab Bar
          AppTranslationsKeys.homeTabBarHome: "الرئيسية",
          AppTranslationsKeys.homeTabBarFavorite: "المفضلة",
          AppTranslationsKeys.homeTabBarCart: "التسوق",
          AppTranslationsKeys.homeTabBarProfile: "حسابي",

          // Home Profile
          AppTranslationsKeys.tabProfileMyAccount: "حسابي",
          AppTranslationsKeys.tabProfileSettings: "اعدادات",
          AppTranslationsKeys.tabProfileHelpCenter: "مركز المساعدة",
          AppTranslationsKeys.tabProfileSignOut: "خروج",
          AppTranslationsKeys.tabProfilePaymentMethods: "طرق الدفع",

          // Show Dialog
          AppTranslationsKeys.showDialogSignOutConfirm: "متاكد",
          AppTranslationsKeys.showDialogSignOutCancel: "لا",
          AppTranslationsKeys.showDialogSignOutTitle: "تسجيل خروج",
          AppTranslationsKeys.showDialogSignOutBody: "هل ترغب بالخروج؟",
          AppTranslationsKeys.showDialogDeleteAccountTitle: "حذف الحساب",
          AppTranslationsKeys.showDialogDeleteAccountBody:
              "هل ترغب بحذف الحساب؟",

          // Profile Settings
          AppTranslationsKeys.tabProfileSettingsLanguage: "اللغة",
          AppTranslationsKeys.tabProfileSettingsDeleteAccount: "حذف الحساب",

          // Profile Help Center
          AppTranslationsKeys.tabProfileHelpCenterTile1:
              "كم مرة يتم تحديث القوائم؟",
          AppTranslationsKeys.tabProfileHelpCenterTile2: "هل هناك أي رسوم؟",
          AppTranslationsKeys.tabProfileHelpCenterTile3:
              "هل يمكنني مشاركة القوائم على وسائل التواصل الاجتماعي؟",
          AppTranslationsKeys.tabProfileHelpCenterTile4:
              "هل يدعم لغات متعددة ؟",
          AppTranslationsKeys.tabProfileHelpCenterTile5:
              "هل الجولات الافتراضية متاحة؟",
        },
        "EN": {
          // Language View
          AppTranslationsKeys.languageTitle: "Choose Language",
          AppTranslationsKeys.languageButtonText: "Go to home page",

          // OnBoarding View
          AppTranslationsKeys.onBoardingButtonText: "Continue",
          AppTranslationsKeys.onBoardingTitleOne: "Choose Product",
          AppTranslationsKeys.onBoardingTitleTwo: "Easy & Safe Payment",
          AppTranslationsKeys.onBoardingTitleThree: "Track Your Order",
          AppTranslationsKeys.onBoardingTitleFour: "Fast Delivery",
          AppTranslationsKeys.onBoardingBodyOne:
              "We Have a 100k Product. Choose \n Your Product From Our E-\n commerce Shop",
          AppTranslationsKeys.onBoardingBodyTwo:
              "Easy Checkout & Safe Payment\n method. Trusted by our Customers\n from all over the world.",
          AppTranslationsKeys.onBoardingBodyThree:
              "Best Tracker has been Used For\n Track your order. You'll know where\n your product is at the moment.",
          AppTranslationsKeys.onBoardingBodyFour:
              "Reliable And Fast Delivery. We\n Deliver your product the fastest\n way possible.",

          // Login View
          AppTranslationsKeys.loginTitle: "Sign In",
          AppTranslationsKeys.loginHeaderOne: "Welcome Back",
          AppTranslationsKeys.loginHeadterTwo:
              "Sign in with your email and password\n or continue with social media",
          AppTranslationsKeys.loginEmailLabel: "Email",
          AppTranslationsKeys.loginEmailHint: "Enter your email",
          AppTranslationsKeys.loginPasswordLabel: "Password",
          AppTranslationsKeys.loginPasswordHint: "Enter your password",

          AppTranslationsKeys.loginRememberMe: "Remember me",
          AppTranslationsKeys.loginForgotPassword: "Forgot password?",
          AppTranslationsKeys.loginButtonText: "Sign In",
          AppTranslationsKeys.loginDontHaveAccount: "Don't have an account? ",
          AppTranslationsKeys.loginSignUpLabel: "Sign Up",

          // Register View
          AppTranslationsKeys.registerTitle: "Sign Up",
          AppTranslationsKeys.registerHeaderOne: "Complete Profile",
          AppTranslationsKeys.registerHeaderTwo:
              "Complete your details or continue with social media",
          AppTranslationsKeys.registerEmailLabel: "Email",
          AppTranslationsKeys.registerEmailHint: "Enter your email",
          AppTranslationsKeys.registerPasswordLabel: "Password",
          AppTranslationsKeys.registerPasswordHint: "Enter your password",
          AppTranslationsKeys.registerButtonText: "Sign Up",
          AppTranslationsKeys.registerHaveAccount: "have an account? ",
          AppTranslationsKeys.registerSignInLabel: "Sign In",
          AppTranslationsKeys.registerUsernameLabel: "Username",
          AppTranslationsKeys.registerUsernameHint: "Enter your username",
          AppTranslationsKeys.registerPhoneLabel: "Phone",
          AppTranslationsKeys.registerPhoneHint: "Enter your phone",

          // Forgot Password View
          AppTranslationsKeys.forgotPasswordHeaderOne: "Forgot Password?",
          AppTranslationsKeys.forgotPasswordHeaderTwo:
              "Please enter email associated.\n We'll send your reset instructions.",
          AppTranslationsKeys.forgotPasswordEmailLabel: "Email",
          AppTranslationsKeys.forgotPasswordEmailHint: "Enter your email",
          AppTranslationsKeys.forgotPasswordButtonText: "Send",

          // Verify Code View
          AppTranslationsKeys.verifyCodeHeaderOne: "Check your email",
          AppTranslationsKeys.verifyCodeHeaderTwo:
              "We sent on 5 digit code to\n",
          AppTranslationsKeys.verifyCodeButtonText: "Verify",
          AppTranslationsKeys.verifyCodeDontReceive:
              "Don't receive the email? ",
          AppTranslationsKeys.verifyCodeResendLabel: "Resend",

          // Reset Password View
          AppTranslationsKeys.resetPasswordHeaderOne: "Reset Password",
          AppTranslationsKeys.resetPasswordHeaderTwo:
              "Please make sure your new password must\n be different from previous used passwords.",
          AppTranslationsKeys.resetPasswordPassLabel: "Password",
          AppTranslationsKeys.resetPasswordPassHint: "Enter your password",
          AppTranslationsKeys.resetRePasswordPassLabel: "Re Password",
          AppTranslationsKeys.resetRePasswordPassHint: "Enter your password",
          AppTranslationsKeys.resetPasswordButtonText: "Reset Password",

          // Success View
          AppTranslationsKeys.successViewButtonText: "Go to home page",
          AppTranslationsKeys.successViewLabel: "Successfully",
          AppTranslationsKeys.successViewText1: "Your password has been reset",
          AppTranslationsKeys.successViewText2: "Your email has been confirm",

          // Valid Input
          AppTranslationsKeys.userNameValid: "Not valid username",
          AppTranslationsKeys.phoneNumberValid: "Not valid phone number",
          AppTranslationsKeys.emailValid: "Not valid email",
          AppTranslationsKeys.emptyValid: "Can't be empty",
          AppTranslationsKeys.minValid: "Can't be less than",
          AppTranslationsKeys.maxValid: "Can't be larger than",
          AppTranslationsKeys.passwordMatchValid: "Password doesn't match",

          // Api Service
          AppTranslationsKeys.validInternet:
              "Check your internet, Please try again",
          AppTranslationsKeys.validGeneral:
              "Opps There was an Error, Please try again",

          // Snack Bar
          AppTranslationsKeys.snackBarSuccessLabel: "Congratulation!",
          AppTranslationsKeys.snackBarBarErrorLabel: "Something went wrong!",
          AppTranslationsKeys.snackBarBarWarringLabel: "Warring",
          AppTranslationsKeys.snackBarRegisterSuccess: "Sign up successfully!",
          AppTranslationsKeys.snackBarVerifyCodeSuccess:
              "Verification successfully!",
          AppTranslationsKeys.snackBarLoginSuccess: "Sign in successfully!",
          AppTranslationsKeys.snackBarResetPasswordSuccess:
              "Reset password successfully!",
          AppTranslationsKeys.snackBarDeleteAccountSuccess:
              "Your account has been deleted successfully!",

          // Home View
          AppTranslationsKeys.homeViewSeachHint: "Search",
          AppTranslationsKeys.homeViewCategoriesLabel: "Categories",
          AppTranslationsKeys.homeViewSeeAllLabel: "See All",
          AppTranslationsKeys.homeViewTodayOffersLabel: "Today's Offers",
          AppTranslationsKeys.homeViewRecommendedLabel: "Recommended For You",
          AppTranslationsKeys.homeViewAllLabel: "All",

          // Home Tab Bar
          AppTranslationsKeys.homeTabBarHome: "Home",
          AppTranslationsKeys.homeTabBarFavorite: "Favorites",
          AppTranslationsKeys.homeTabBarCart: "Cart",
          AppTranslationsKeys.homeTabBarProfile: "Profile",

          // Tab Profile
          AppTranslationsKeys.tabProfileMyAccount: "My Account",
          AppTranslationsKeys.tabProfileSettings: "Settings",
          AppTranslationsKeys.tabProfileHelpCenter: "Help Center",
          AppTranslationsKeys.tabProfileSignOut: "Sign Out",
          AppTranslationsKeys.tabProfilePaymentMethods: "Payment Methods",

          // Show Dialog
          AppTranslationsKeys.showDialogSignOutConfirm: "Confirm",
          AppTranslationsKeys.showDialogSignOutCancel: "Cancel",
          AppTranslationsKeys.showDialogSignOutTitle: "Sign Out",
          AppTranslationsKeys.showDialogSignOutBody: "Do you want to log out?",
          AppTranslationsKeys.showDialogDeleteAccountTitle:
              "Deactivating Account",
          AppTranslationsKeys.showDialogDeleteAccountBody:
              "Do you want to Deactivating Account?",

          // Profile Settings
          AppTranslationsKeys.tabProfileSettingsLanguage: "Language",
          AppTranslationsKeys.tabProfileSettingsDeleteAccount:
              "Deactivating Account",

          // Profile Help Center
          AppTranslationsKeys.tabProfileHelpCenterTile1:
              "How often are listings updated?",
          AppTranslationsKeys.tabProfileHelpCenterTile2: "Are there any fees?",
          AppTranslationsKeys.tabProfileHelpCenterTile3:
              "Can I share listings on social media?",
          AppTranslationsKeys.tabProfileHelpCenterTile4:
              "Does it support multiple languages?",
          AppTranslationsKeys.tabProfileHelpCenterTile5:
              "Are virtual tours available?",
        },
      };
}
