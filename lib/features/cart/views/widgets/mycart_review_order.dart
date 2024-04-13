import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/cart/controller/mycart_controller.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_card.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyCartReviewOrder extends GetView<MyCartControllerImpl> {
  const MyCartReviewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GetBuilder<MyCartControllerImpl>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTranslationsKeys.myCartReviewYourOrder.tr,
                style: AppTextStyle.textStyle16,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    .13 *
                    (controller.cartList.length > 3
                        ? 3
                        : controller.cartList.length),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cartList.length,
                  itemBuilder: (context, index) => MyCartCard(
                    itemModel: controller.cartList[index].itemModel!,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
