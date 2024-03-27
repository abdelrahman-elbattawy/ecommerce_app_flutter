import 'package:ecommerce_app/core/constants/app_assets_images.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class PageLoadingIndicator extends StatelessWidget {
  const PageLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssetsImages.loadingLottie,
        height: MediaQuery.of(context).size.width * .4,
        width: MediaQuery.of(context).size.width * .4,
      ),
    );
  }
}
