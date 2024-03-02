import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mai_greatit/presentations/widget/section_user_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardUserAccount extends HookWidget {
  const CardUserAccount({super.key});
  @override
  Widget build(BuildContext context) {
        final animatedIconArrowController=useAnimationController(duration: const Duration(milliseconds: 200));
    final animatedIconArrow=useAnimation<double>(
        Tween<double>(begin: 180,end: 1).animate(CurvedAnimation(parent: animatedIconArrowController,
            curve: Curves.linearToEaseOut))
    );
    final isOpenCardAccount=useState(false);
    return Material(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
          width: MediaQuery.of(context).size.width - 30,
          height: isOpenCardAccount.value?250:180,
          decoration: const BoxDecoration(
              color: Color(0xFF263238),
              borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       Expanded(
                            child: SectionUserAccount(
                                amount: 1000000,
                                title: "Solde principal",
                                isLeftCard: true,
                                icon: "orangeMoney",
                                sizeIcon: 15,
                              animatedIconArrow: animatedIconArrow,
                              animatedIconArrowController: animatedIconArrowController,
                              onPressedAccountPlus: (){
                                  if(isOpenCardAccount.value){
                                    animatedIconArrowController.reverse();
                                  }else{
                                    animatedIconArrowController.forward();
                                  }
                              isOpenCardAccount.value=!isOpenCardAccount.value;
                              },
                            )),
                        const SizedBox(width: 5,),
                        Container(
                          width: 1,
                          color: Colors.white.withAlpha(100),
                        ),
                        const SizedBox(width: 5,),
                        const Expanded(
                            child: SectionUserAccount(
                                amount: 55000,
                                title:"Principal", isLeftCard: false,
                                icon: "phone",sizeIcon:25)),
                      ],
                    ),
                  ),
                ),
                isOpenCardAccount.value?
                    Container(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff2b3d46).withAlpha(150),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Compte Plus",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                             Text("450.000 CFA",style: TextStyle(color: Colors.white,fontSize: 16),)
                          ],
                        ),
                      ):
                    const SizedBox(),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.deepOrangeAccent.withAlpha(100)),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xFF37474F)
                        ),
                        shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)
                          ))
                        )
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/clock.svg",width: 20,height: 20,),
                          const SizedBox(width: 10,),
                          const Expanded(
                              child: Text(
                            "Mes transactions Orange Money",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          )),
                          const SizedBox(
                            child: Row(
                              children: [
                                Text("Voir plus",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
      
                                Icon(Icons.arrow_forward_rounded,size: 20,color: Colors.deepOrangeAccent,)
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ])),
    );
  }
}
