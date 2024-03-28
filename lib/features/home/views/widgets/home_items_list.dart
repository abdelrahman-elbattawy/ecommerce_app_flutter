import 'package:ecommerce_app/features/home/views/widgets/home_item_card.dart';
import 'package:flutter/material.dart';

class HomeItemsList extends StatelessWidget {
  const HomeItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .65,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => const HomeItemCard(),
      ),
    );
  }
}
