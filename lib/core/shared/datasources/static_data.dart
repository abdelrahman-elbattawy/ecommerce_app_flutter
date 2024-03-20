import 'package:ecommerce_app/core/constants/app_assets_images.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/language/data/models/language_model.dart';
import 'package:ecommerce_app/features/onBoarding/data/models/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: AppTranslationsKeys.onBoardingTitleOne,
    body: AppTranslationsKeys.onBoardingBodyOne,
    image: AppAssetsImages.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: AppTranslationsKeys.onBoardingTitleTwo,
    body: AppTranslationsKeys.onBoardingBodyTwo,
    image: AppAssetsImages.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: AppTranslationsKeys.onBoardingTitleThree,
    body: AppTranslationsKeys.onBoardingBodyThree,
    image: AppAssetsImages.onBoardingImageThree,
  ),
  OnBoardingModel(
    title: AppTranslationsKeys.onBoardingTitleFour,
    body: AppTranslationsKeys.onBoardingBodyFour,
    image: AppAssetsImages.onBoardingImageFour,
  ),
];

List<LanguageModel> languageList = [
  LanguageModel(
    countryName: 'United States',
    languageName: 'English',
    abbreviation: 'EN',
    image: AppAssetsImages.americanFlag,
  ),
  LanguageModel(
    countryName: 'Egypt',
    languageName: 'Arabic',
    abbreviation: 'AR',
    image: AppAssetsImages.egyptFlag,
  ),
];
