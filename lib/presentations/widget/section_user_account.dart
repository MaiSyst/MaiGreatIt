import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
class SectionUserAccount extends HookWidget {
  final int amount;
  final String title;
  final bool isLeftCard;
  final String icon;
  final double sizeIcon;
  final bool isOpenCardAccount;
  final Function ?onPressedAccountPlus;
  final AnimationController ? animatedIconArrowController;
  final double? animatedIconArrow;
  const SectionUserAccount(
      {super.key,
      required this.title,
      required this.icon,
      required this.isLeftCard,
      required this.amount,
      required this.sizeIcon,
        this.onPressedAccountPlus,
        this.isOpenCardAccount=false,
        this.animatedIconArrowController,
        this.animatedIconArrow
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            splashColor: Colors.deepOrangeAccent.withAlpha(50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SizedBox(
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/$icon.svg",
                      width: sizeIcon,
                      height: sizeIcon,
                    ),
                  ),
                )),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            splashColor: Colors.deepOrangeAccent.shade100,
                            icon: const Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                            )),
                        isLeftCard
                            ? AnimatedBuilder(
                            animation: animatedIconArrowController!,
                            builder: (BuildContext context,child)=>
                                Transform.rotate(angle: -math.pi / animatedIconArrow!,
                                  child: child,),
                            child: IconButton(onPressed: ()=>onPressedAccountPlus!(),
                            icon: SvgPicture.asset(
                                "assets/images/chevron-down.svg",
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              )),
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
       isLeftCard?
            Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "$amount CFA",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))
                ],
              ),
            ),
          ),
        )
           :
         Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
               onPressed: () {},
            splashColor: Colors.deepOrangeAccent.withAlpha(50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "$amount CFA",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
