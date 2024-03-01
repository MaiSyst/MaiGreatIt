import 'package:mai_greatit/presentations/widget/section_user_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardUserAccount extends StatefulWidget {
  const CardUserAccount({super.key});

  @override
  State<CardUserAccount> createState() => _CardUserAccountState();
}

class _CardUserAccountState extends State<CardUserAccount> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 200,
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
                       const Expanded(
                            child: SectionUserAccount(
                                amount: 53,
                                title: "Solde principal",
                                isLeftCard: true,
                                icon: "orangeMoney",
                                sizeIcon: 15)),
                        const SizedBox(width: 5,),
                        Container(
                          width: 1,
                          color: Colors.white.withAlpha(100),
                        ),
                        const SizedBox(width: 5,),
                        const Expanded(
                            child: SectionUserAccount(
                                amount: 13,
                                title:"Principal", isLeftCard: false,
                                icon: "phone",sizeIcon:25)),
                      ],
                    ),
                  ),
                ),
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
