import 'package:flutter/material.dart';

import 'mai_bottom_nav_item.dart';

class MaiBottomNavBar extends StatelessWidget {
  final List<MaiBottomNavItem>maiBottomNavItem;
  const MaiBottomNavBar({super.key,required this.maiBottomNavItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepOrange.withAlpha(100))
      ),

      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: maiBottomNavItem,
      ),
    );
  }
}
