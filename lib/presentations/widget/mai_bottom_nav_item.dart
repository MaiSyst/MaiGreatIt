import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MaiBottomNavItem extends HookWidget {
  final String title;
  final Widget icon;
  final bool isSelected;
  final Function onPressed;
  final int currentIndex;
  const MaiBottomNavItem({super.key,
    required this.icon,
    required this.title,
    required this.isSelected,required this.onPressed,required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>onPressed(currentIndex),
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5,),
          Text(title,style: TextStyle(fontSize: 11,
              color: isSelected?Colors.deepOrangeAccent:Colors.black
          ),)
        ],
      ),
    );
  }
}
