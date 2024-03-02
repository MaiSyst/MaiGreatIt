import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCircle extends HookWidget {
  final String iconName;
  final String title;
  final Function ?onPressed;
  const ButtonCircle({super.key,required this.title,required this.iconName,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>print("Tap"),
      splashColor: Colors.orange.shade50,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange,width: 2),
                    borderRadius: BorderRadius.circular(50)
              ),
              child: SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset("assets/images/$iconName.svg"),),
            ),
            const SizedBox(height: 10,),
            Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
