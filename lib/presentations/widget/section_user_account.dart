import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionUserAccount extends StatelessWidget {
  final int amount;
  final String title;
  final bool isLeftCard;
  final String icon;
  final double sizeIcon;
  const SectionUserAccount({super.key,required this.title,required this.icon,required this.isLeftCard,required this.amount,required this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: (){},
            splashColor: Colors.deepOrangeAccent.withAlpha(50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: SvgPicture.asset("assets/images/$icon.svg",
                        width: sizeIcon,height: sizeIcon,
                      ),
                    ),
                  )
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){},
                            splashColor: Colors.deepOrangeAccent.shade100,
                            icon: const Icon(Icons.remove_red_eye_sharp,color: Colors.white,)),

                        isLeftCard
                            ? SvgPicture.asset(
                                "assets/images/chevron-down.svg",
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              )
                            : const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex:1,
        child: Padding(
          padding: EdgeInsets.only(left:8.0,top: 10),
          child: Text(
            "Solde principal",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ),),
        Expanded(
          flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                        "$amount CFA",
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                      ),
            ))
      ],
    );
  }
}
